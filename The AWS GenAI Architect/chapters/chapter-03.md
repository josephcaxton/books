# Chapter 3: The Enterprise GenAI Problem Space

A Generative AI (GenAI) system that works in isolation is a modest achievement. A GenAI system that works within the enterprise, across its data, its identities, its accounts, its security boundaries and its business processes, is the real problem. This chapter defines that problem space, because the patterns in the rest of the book are answers to it, and an answer is only as good as the understanding of the problem it addresses.

The purpose here is not to design anything yet. It is to establish the concepts and vocabulary an architect uses to reason about enterprise GenAI, so that later chapters can refer to them precisely rather than reintroduce them each time.

---

## 3.1 Enterprise complexity: data, identities, accounts, boundaries and processes

The demonstrations that persuade organisations to invest in GenAI almost always run in a simplified world. One user, one dataset, one account, broad permissions, no adversaries, no compliance obligation and no cost ceiling. The enterprise is the opposite of that world on every axis.

**Data is distributed, owned and sensitive.** Enterprise data lives across many systems, each with an owner, a classification and rules about who may see it. It is rarely clean, rarely centralised and rarely free of obligations. Feeding this data to a model, or into a retrieval index, means respecting ownership and classification at every step. Data that was safe in its system of record can become a leak when copied carelessly into a shared index.

**Identity is layered and consequential.** In an enterprise, the identity that matters is not "the application". It is the specific user or service on whose behalf a request is made, with the specific entitlements that identity carries. A GenAI system that collapses many users into a single powerful identity discards the very information the enterprise relies on to control access.

**Accounts partition the estate.** Enterprises on AWS typically operate many accounts, used to separate environments, teams, workloads and risk. A GenAI capability rarely lives in one account. It spans application accounts, and often dedicated accounts for AI, platform, security and logging. Where a capability is placed, and how accounts connect, is an architectural decision with security and operational consequences.

**Boundaries are everywhere and they matter.** Networks, accounts, teams, data classifications and regulatory jurisdictions all impose boundaries. Enterprise architecture is largely the discipline of deciding which boundaries to respect, which to cross, and how. GenAI does not remove these boundaries; it must operate within them.

**Processes give the system its purpose.** A GenAI capability exists to serve a business process, and that process brings requirements, latency expectations, availability targets, audit obligations and failure consequences, that the architecture must satisfy.

The enterprise problem, then, is not "make the model answer well". It is "make the model answer well while respecting data ownership, honouring identity, operating across accounts, staying within boundaries and serving a real process". Every pattern in this book is shaped by that longer sentence.

---

## 3.2 Control plane and data plane in GenAI systems

A distinction that clarifies almost every GenAI architecture is the separation of the control plane from the data plane.

The **control plane** is where decisions and management happen: authenticating a request, evaluating policy, deciding which model should serve it, applying rate limits, recording usage, and enforcing governance. The control plane is concerned with whether and how a request should proceed.

The **data plane** is where the work happens: retrieving context, performing inference, invoking tools and returning a response. The data plane is concerned with actually producing the result.

Keeping these planes distinct is valuable for the same reasons it is valuable elsewhere in cloud architecture. It lets you enforce policy consistently in one place rather than scattering it through every application. It lets the data plane scale according to inference demand while the control plane scales according to management needs. It clarifies where a given responsibility belongs, which reduces the chance that a control is quietly omitted.

Much of what later chapters call the AI Gateway is, in essence, a deliberate control plane placed in front of the data plane where inference occurs. When you find yourself unsure where a responsibility should live, asking whether it is a control plane concern or a data plane concern usually resolves it.

---

## 3.3 Trust boundaries, blast radius and tenancy

Three related concepts govern how much damage a fault or an attack can do, and they should be in an architect's mind from the first diagram.

A **trust boundary** is a line across which you stop assuming good behaviour and start verifying it. The boundary between an untrusted user and your application is obvious. Less obvious, and more important in GenAI, is that content retrieved for grounding, and input that reaches a model, may carry instructions that attempt to influence the model. A well placed trust boundary treats such content as data to be handled, not as instruction to be obeyed. Knowing where your trust boundaries are is the precondition for defending them.

**Blast radius** is the extent of harm when something fails or is compromised. A model that is unavailable, a retrieval source that returns the wrong tenant's data, an agent that invokes a tool it should not, each has a blast radius, and architecture determines how large it is. A design that gives an autonomous component broad, standing access has a large blast radius. A design that scopes access narrowly, per identity and per action, contains it. Reducing blast radius is one of the most reliable ways to make a GenAI system safer without making it more complex.

**Tenancy** describes how multiple consumers, teams, business units or customers, share the system. Shared infrastructure is efficient but raises the stakes of isolation: the architecture must ensure that one tenant cannot see another tenant's data, exhaust another tenant's capacity, or influence another tenant's results. In GenAI, tenancy applies not only to compute but to context: retrieval indexes, caches, memory and logs all need tenancy discipline, because they all can carry one tenant's data into another tenant's request.

Together these three give you a way to reason about safety that does not depend on assuming nothing will ever go wrong.

---

## 3.4 Centralisation, federation and distribution: a precise distinction

Few words are used more loosely in enterprise architecture than "centralised" and "federated", and the looseness causes real design confusion. This book uses them precisely, and it is worth fixing the meanings now.

**Centralisation** means a capability is provided from a single, shared point of control. A central AI Gateway through which all applications reach foundation models is centralised: one place enforces policy, records usage and governs access. Centralisation favours consistency, governance and economy of scale, at the cost of creating a shared dependency and a potential bottleneck.

**Federation** means responsibility is shared between a centre and semi autonomous participants, under a common framework. A federated AI platform might centralise governance, identity and guardrails while allowing each application account to own its own data, its own retrieval and its own workloads within agreed rules. Federation seeks a balance: consistent where consistency matters, autonomous where local ownership matters.

**Distribution** means a capability is spread across many independent locations without a single point of control. Fully distributed GenAI, where each team integrates with models independently, maximises autonomy and minimises shared dependency, at the cost of inconsistent governance, duplicated effort and fragmented visibility.

These are not three labels for the same idea, and they are not points on a single slider where more of one is simply less of another. They describe different distributions of control and ownership, each appropriate in different circumstances. A small organisation may be well served by simple distribution. A large regulated enterprise usually needs federation, and often centralises specific concerns such as guardrails while distributing others such as data. The mistake to avoid is using the words interchangeably, because doing so hides the very decision the architect is supposed to make.

---

## 3.5 Constraints that shape every architectural decision

No GenAI architecture is chosen in a vacuum. It is chosen under constraints, and the constraints, more than any preference for a particular pattern, determine what is appropriate. Making the constraints explicit is one of the most useful things an architect can do early, because an unstated constraint is the most common reason a design fails late.

The constraints that recur across enterprise GenAI include:

- **Security requirements** — what must be protected, from whom, and to what standard.
- **Regulatory and compliance obligations** — the rules the system must demonstrably satisfy, and the evidence it must produce.
- **Data residency and sovereignty** — where data, including data in transit to inference, is permitted to be.
- **Operating model** — whether the organisation is centralised, federated or distributed in how it runs technology, since the AI architecture rarely succeeds by fighting the operating model.
- **Scale** — the number of users, requests, teams and data domains the system must serve, now and plausibly later.
- **Latency** — how quickly a response is required, which constrains model choice, retrieval design and network paths.
- **Cost** — the budget within which the system must remain commercially sustainable.
- **Organisational maturity** — the skills, tooling and operational capability actually available, as distinct from those one might wish for.

The reason these matter so much is that they are what make architecture contextual. A pattern that is correct for an organisation with strict residency requirements and high maturity may be wrong for an organisation with neither. This is why every pattern chapter in this book discusses not only how the pattern works but when it should and should not be used, and why the same pattern appears in different forms for organisations of different size and maturity. There is no architecture that is correct independent of its constraints.

> **📐 Architect's Verdict**
>
> The enterprise GenAI problem is not a model problem; it is the problem of operating a probabilistic capability within an environment of distributed data, layered identity, many accounts, real boundaries and genuine constraints. The concepts in this chapter, control plane and data plane, trust boundary, blast radius, tenancy, and the precise distinction between centralisation, federation and distribution, are the tools for reasoning about that problem. Every pattern that follows is an answer to some part of it, and every answer is judged against the constraints of the organisation adopting it.
