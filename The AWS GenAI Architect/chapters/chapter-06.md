# Chapter 6: Direct Bedrock Integration

This is the first pattern chapter, and it deliberately begins with the simplest pattern of all: an application that calls Amazon Bedrock directly. It is tempting to skip the simple case and move straight to gateways and platforms, but that would be a mistake. Most enterprise GenAI journeys begin here, many workloads never need to leave, and understanding this pattern precisely is what lets you recognise when it is no longer sufficient. The architectural skill on display in this chapter is restraint: knowing when the simplest design is the right one.

---

## 1. The Architectural Problem

An application needs to use a foundation model. A team has a specific, bounded use case, summarising documents, drafting responses, classifying inputs, and wants to add model inference to it.

The problem is genuine but narrow. There is one application, owned by one team, with its own data and its own users. There is no immediate requirement to share the capability with other applications, to enforce organisation wide policy, or to route between many models. What is needed is a reliable, secure way for this application to perform inference.

The constraint that matters most here is proportionality. The organisation could build an elaborate platform, but at this stage that would be complexity without a corresponding problem to justify it. If the simple need is met with a simple design, effort is spent where it creates value. If it is met with a large platform, effort is spent defending against problems the workload does not yet have.

The architectural question is therefore not "how do we build an AI platform?" but "what is the least architecture that meets this need safely, and how will we know when that is no longer enough?"

---

## 2. 🧩 The Pattern at a Glance

- **Pattern name:** Direct Bedrock Integration
- **Problem solved:** Adding foundation model inference to a single application without unnecessary platform complexity.
- **Primary objective:** Reliable, secure inference for one workload with minimal moving parts.
- **When to use:** A single application or small number of independent applications; no requirement yet for shared governance or centralised control.
- **When not to use:** Multiple applications needing consistent policy, centralised routing, shared observability or organisation wide governance.
- **Key AWS services:** Amazon Bedrock, plus the application's existing compute (Lambda or containers), IAM, and networking.
- **Primary architectural concern:** Proportionality, applying only the complexity the problem requires while keeping security and resilience intact.

In this pattern the application talks to Bedrock's data plane directly. There is no intermediary control plane of your own; the controls live in IAM, the application code and the network configuration.

---

## 3. The Architecture

The reference architecture is intentionally small:

- **Users** interact with the application through its existing interface.
- **The application**, running on Lambda or on containers in ECS or EKS, receives requests, assembles the context to send to the model, and calls Bedrock.
- **An execution role** attached to the application grants scoped permission to invoke specific Bedrock models.
- **A private network path**, using a VPC endpoint for Bedrock, keeps inference traffic off the public internet.
- **Amazon Bedrock** performs inference and returns the response.
- **Observability and logging**, using the application's existing monitoring, record requests, latency, token usage and errors.

Each component has a clear role. The application owns context assembly and any validation of output. The execution role expresses least privilege. The VPC endpoint expresses the network boundary. Bedrock is the data plane. There is no separate control plane because, at this scale, the application and its IAM role are the controls.

---

## 4. Request and Data Flow

> **Step 1:** A user submits a request to the application.
> **Step 2:** The application authenticates and authorises the user through its existing mechanism.
> **Step 3:** The application assembles the context: the instruction and any data the task requires.
> **Step 4:** Using its execution role, the application calls Bedrock over the private VPC endpoint.
> **Step 5:** Bedrock performs inference and returns a response, streamed where appropriate.
> **Step 6:** The application validates or post-processes the output as needed.
> **Step 7:** The application records latency, token usage and outcome through its monitoring.
> **Step 8:** The application returns the result to the user.

The flow makes the pattern's simplicity concrete. There is one hop to the model, one identity involved, and one place, the application, where context is assembled and output is handled.

---

## 5. Why This Pattern Works

The pattern works because it matches the complexity of the solution to the complexity of the problem. For a single application, the concerns that justify a gateway, consistent policy across many consumers, centralised routing, shared usage visibility, simply do not yet exist. Introducing infrastructure to address absent problems adds operational surface, latency and cost without benefit.

It also works because it does not sacrifice the essentials for simplicity. Security is preserved through scoped IAM and a private network path. Resilience is preserved by treating Bedrock as the remote dependency it is. Observability is preserved by recording the metrics that matter. The pattern is simple, but it is not careless, and that distinction is the whole point.

---

## 6. 🏗️ Architectural Decisions

| Decision | Options | Recommended approach | Reason |
| --- | --- | --- | --- |
| Control plane | Own gateway / None | None | A single application does not justify a gateway |
| Compute | Lambda / Containers | Match existing workload | Reuse the team's operational model |
| Network path | Public / Private | Private (VPC endpoint) | Keep inference traffic off the public internet |
| Model selection | Fixed / Routed | Fixed | One workload rarely needs runtime routing |
| Identity to model | Application role / Per user | Scoped application role | Simplicity, with least privilege preserved |

These defaults favour simplicity, but each remains a decision. If a workload genuinely needs per-request routing or per-user identity at the model, that is a signal it may be outgrowing this pattern.

---

## 7. ⚖️ Trade-offs

**Benefits:** Minimal complexity, low latency (one hop to the model), fast to build, easy to reason about, and inexpensive to operate.

**Costs and limitations:** No shared governance. Each application that adopts the pattern independently must implement its own security, observability and cost controls, which duplicates effort and invites inconsistency as the number of applications grows.

**Complexity:** Low. This is the pattern's defining virtue.

**Operational overhead:** Low for one application, but it rises linearly and unevenly as more applications each reinvent the same controls.

**Security implications:** Sound for a single application with scoped IAM, but there is no central point at which to enforce policy consistently across many applications later.

**Performance implications:** Excellent; the absence of an intermediary means minimal added latency.

**Cost implications:** Low infrastructure cost. The risk is fragmented, unattributed model spend once several applications integrate independently, with no central place to see or control it.

---

## 8. 🔐 Security and Governance

Security in this pattern rests on a small number of well applied controls. The application's execution role should grant only the specific Bedrock actions and models it needs, and nothing more. Requests should travel a private path. Data sent as context, and prompts and responses recorded in logs, must respect the data's classification and residency, exactly as Chapter 5 argued. Where the application requires structured output, it must validate that output rather than trust it.

The governance limitation is inherent and should be stated plainly: there is no central control point. For one application that is acceptable, because the application is the boundary. The moment consistent policy must apply across several applications, this pattern offers no place to enforce it, and that absence, rather than any security flaw in the pattern itself, is what eventually motivates the AI Gateway.

---

## 9. 🌐 Networking

The network design is straightforward and important. Inference traffic should reach Bedrock through a VPC endpoint, keeping it on a private path rather than traversing the public internet. This aligns the pattern with standard enterprise practice for reaching AWS services privately, and it is the same reasoning an architect already applies to other sensitive service calls. Beyond the private endpoint, the networking here introduces nothing unusual; the application's existing VPC design accommodates it.

---

## 10. ⚠️ Failure Modes and Resilience

The dominant failure modes are those of any remote dependency, plus the model specific ones from Chapter 4.

- **Model unavailable or throttled:** On demand capacity is subject to shared limits. The application must handle throttling with sensible retries and backoff, and degrade gracefully rather than failing hard.
- **Latency spikes:** Inference latency varies. The application needs timeouts and, for interactive use, streaming to preserve responsiveness.
- **Malformed or unexpected output:** Because output is probabilistic, the application must validate it where a structured result is required, rather than assume compliance.
- **Regional issues:** A regional problem affects availability. Whether to design for multi region resilience is a proportionality decision; many single application workloads accept single region operation, and that is a legitimate choice made explicitly rather than by omission.

The theme is that resilience here is the application's responsibility, because there is no intermediary to provide it.

---

## 11. 👁️ Observability and Operations

The application should record, at minimum, request latency, token consumption, error and throttling rates, and outcome. These are the metrics that reveal both operational health and cost, and they are the same signals a gateway would centralise later. Recording them from the start has a practical benefit beyond operations: it produces the usage data that later tells you whether the workload is approaching the scale at which a shared platform becomes worthwhile.

Distinguish, as always, technical observability (latency, errors, tokens) from evaluation of output quality; the latter is addressed in its own chapter but should not be neglected simply because the pattern is small.

---

## 12. 💷 Cost and FinOps

The main cost drivers are inference and tokens, since the pattern adds little infrastructure of its own. This makes token discipline, sending only the context the task requires, the primary cost lever, consistent with Chapter 4's point that tokens are the currency of GenAI.

The FinOps risk specific to this pattern is not high per-application cost but fragmentation. When several teams each integrate directly, model spend is spread across accounts and roles with no central view, making it hard to see total GenAI cost or to attribute it. For a single application this is a non-issue; as adoption spreads it becomes one of the clearest signals that centralisation would help.

---

## 13. When to Use This Pattern

Use this pattern when:

- a single application, or a few genuinely independent ones, needs model inference;
- there is no current requirement for consistent policy across many consumers;
- routing between multiple models at request time is not needed;
- the team can own its own security, resilience and observability; and
- speed and simplicity are more valuable than shared governance.

It is often the correct starting point even for organisations that will eventually need more, because it delivers value quickly and generates the usage evidence that later decisions depend on.

---

## 14. When NOT to Use This Pattern

Do not use this pattern when:

- multiple applications require consistent security or policy enforcement;
- the organisation needs a central view of model usage and cost;
- requests must be routed across several models by policy;
- governance requires a single point of control over which models may be used and by whom; or
- the same controls are being reimplemented in application after application.

Each of these is a symptom of the same underlying condition: the problem has grown beyond a single workload. When that happens, continuing to scale this pattern by repetition trades short term familiarity for long term inconsistency. That is the point at which the AI Gateway pattern, the subject of the next chapter, earns its complexity.

---

## 15. Pattern Variations

- **Small organisation:** A single application integrates directly with Bedrock. This is often the whole architecture, and that is appropriate.
- **A few independent applications:** Each integrates directly, accepting some duplication in exchange for autonomy and speed, provided no shared governance is yet required.
- **Transitional:** Direct integration is retained for existing workloads while new ones begin adopting a gateway, allowing gradual migration rather than a disruptive rewrite.

The variations differ mainly in how many times the pattern is repeated before its limitations justify a different approach.

---

## 16. Architecture Decision Checklist

- [ ] Is this genuinely a single application, or the first of many that will need shared controls?
- [ ] Does the execution role grant least privilege to specific models and actions?
- [ ] Is inference traffic on a private network path?
- [ ] Are context data and logged prompts and responses within classification and residency rules?
- [ ] Are throttling, timeouts and retries handled by the application?
- [ ] Is output validated where a structured result is required?
- [ ] Are latency, tokens, errors and cost being recorded?
- [ ] Is there a defined signal that will indicate the workload has outgrown this pattern?

---

## 17. 📐 The Architect's Verdict

> Direct Bedrock Integration is the right pattern when the problem is genuinely a single application and simplicity is more valuable than shared governance. It delivers value quickly, keeps latency low, and remains easy to reason about, provided security and resilience are not sacrificed for that simplicity. Its limitation is inherent rather than accidental: it offers no central point of control, so it does not scale to many applications needing consistent policy. Adopt it deliberately, instrument it from the start, and define in advance the signals, multiple consumers, fragmented cost, duplicated controls, that will tell you it is time to move to the AI Gateway. Choosing the simplest sufficient pattern is not a lack of ambition. It is architecture.
