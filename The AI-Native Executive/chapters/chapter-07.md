# Chapter 7: The Inference Budget

## Part III: Executive Decision Frameworks

---

## The Executive Vignette

A mid-market SaaS company in Boston had deployed AI across four operational functions by mid-2024: customer support triage, contract summarisation, lead scoring, and internal knowledge retrieval. Each function consumed tokens from the same frontier model API — a premium offering priced at $15 per million input tokens and $60 per million output tokens. There was no centralised tracking. No allocation logic. No cost-per-workflow visibility. No routing layer that differentiated between tasks.

The deployment had been celebrated. Customer response times dropped 40%. Contract review cycles shortened from five days to six hours. The leadership team congratulated themselves on their AI transformation. The engineering team moved on to new projects.

In Q3 2024, the CFO received a cloud services invoice showing a 340% increase in AI infrastructure costs compared to Q1 — from $38,000 per month to $167,000 per month. The increase had compounded over three months without a single alert. No one had been watching. The cost was buried in a "cloud services" line item alongside storage, networking, and standard compute.

The CFO demanded attribution. The engineering team scrambled. It took them two weeks to reconstruct which function was consuming what — because no telemetry had been built to track token usage at the workflow level. The forensic analysis revealed the anatomy of the waste:

The customer support triage function was handling 80,000 tickets per month. Every single interaction — regardless of complexity — was being routed through the frontier model. A trivial password reset request ("How do I change my password?") consumed the same expensive inference as a complex billing dispute requiring multi-document analysis. A query that should have cost $0.002 to process was costing $0.14 — because the application architecture had no concept of task differentiation. Every input received the maximum computational treatment.

The password reset queries alone — 34,000 per month, answerable by a simple retrieval lookup against the help documentation — were consuming $4,760 in frontier model tokens monthly. A lightweight model or even a deterministic rule would have handled them for under $50.

The contract summarisation function was equally undisciplined. Every document — from a two-page standard NDA to a ninety-page bespoke enterprise agreement — was processed identically. The two-page NDAs required approximately 800 tokens to summarise. The enterprise agreements required 12,000. But the system allocated the same processing pipeline to both, including redundant multi-pass analysis steps designed for complex documents that added no value when applied to standard templates.

When the attribution analysis was complete, the picture was stark: the company was spending $47,000 per month on inference for the customer support function whose output quality would have been identical at $6,200 per month — if someone had implemented a tiered model routing strategy that sent simple queries to a lightweight model and reserved the frontier model for genuine complexity. Across all four functions, approximately $94,000 per month — 56% of total AI spend — was pure waste: expensive capability deployed against tasks that did not require it.

The CEO asked the obvious question: "Who was managing this?"

No one was. Because inference had never been framed as a budget. It was treated as a generic cloud cost — invisible, unallocated, and unoptimised. No one owned it. No one tracked it. No one was accountable for it. And so it grew without constraint, like any unmanaged cost in any organisation where accountability is absent.

The inference budget is not a technical concern for the engineering team to handle in the background. It is a financial governance imperative that demands the same C-suite attention as headcount planning, marketing spend allocation, or capital expenditure oversight. Every token consumed is a unit of operational expenditure with a direct impact on margin. Every workflow that runs without cost visibility is a margin leak. And every enterprise that fails to manage inference economics will discover — usually through an alarming invoice — that AI capability without financial discipline is just expensive chaos.

---

## The Strategic Framework

### 7.1 The Shift from IT CapEx to Dynamic OpEx: Why Traditional Budgeting Models Fail

Traditional enterprise IT budgeting operates on a capital expenditure model refined over three decades of enterprise software procurement. You purchase software licences, hardware infrastructure, and implementation services upfront. Costs are amortised over three to five years. Budgets are set annually and adjusted quarterly at most. Consumption is largely static — the licence costs the same whether you use the software eight hours a day or eight minutes a day.

This model worked for enterprise software because the cost structure was genuinely fixed. A Salesforce licence cost the same per seat regardless of how many records a user created. A server cost the same per month regardless of how many queries it processed (within hardware limits). The IT budget was predictable, stable, and largely disconnected from business volume fluctuations.

AI-native infrastructure operates on an entirely different financial model: **dynamic operational expenditure that varies with consumption in real time.** Every API call, every token processed, every inference request carries a direct, measurable cost. Usage spikes create cost spikes. Efficiency gains create immediate savings. A 20% increase in customer service volume translates directly — within the same billing cycle — into a 20% increase in inference cost for that function. Conversely, routing 60% of queries to a cheaper model produces immediate, measurable savings in the next monthly invoice.

| Dimension | Traditional IT (CapEx) | AI-Native Infrastructure (Dynamic OpEx) |
|---|---|---|
| Cost trigger | Purchase event (licence, hardware) | Every inference request (per token) |
| Cost variability | Fixed over licence period | Fluctuates with real time usage volume |
| Budget predictability | High (static annual commitments) | Moderate (requires volume forecasting) |
| Waste visibility | Low (licence paid regardless of use) | High (every unused token is zero cost) |
| Optimisation lever | Negotiate better licence terms at renewal | Route, throttle, tier, and cache intelligently |
| Cost attribution | Typically allocated to IT department as overhead | Directly attributable to specific workflows, departments, and executions |
| Response to business decline | Costs remain fixed (sunk) | Costs decrease automatically with volume |
| Overuse penalty | None (flat pricing) | Linear cost increase per unit of consumption |

This shift has profound implications for financial governance. The CFO can no longer set an annual IT budget, negotiate it once, and review it quarterly. AI costs are living, breathing operational expenses that move with the business every single day. They require the same granular attention that a logistics company gives to fuel costs, a manufacturer gives to raw material pricing, or a trading desk gives to transaction fees.

The enterprises that treat inference as a generic line item within "cloud costs" will haemorrhage margin without knowing where it went. The enterprises that manage it as a precision instrument — with cost-per-execution visibility, intelligent routing, and rigorous allocation — will extract maximum capability at minimum cost. The difference is not marginal. As our opening vignette demonstrates, undisciplined inference management can waste 50-60% of total AI spend on inappropriate model allocation alone.

**The Budgeting Cycle Must Accelerate:**

Annual budgets are inadequate for AI infrastructure governance. The technology moves too fast (model pricing changes quarterly), consumption patterns shift with business seasonality, and optimisation opportunities emerge continuously as new, cheaper models enter the market. The AI-native enterprise requires:
- Monthly inference budget reviews at department level.
- Weekly automated reporting on cost-per-execution trends and anomalies.
- Real-time alerting when any workflow's cost profile deviates from established baselines by more than 15%.
- Quarterly "model market review" to evaluate whether cheaper alternatives have emerged for current workloads.

### 7.2 Token Economics and Margin Math: The Cost Per Inference Framework

Every AI-powered workflow has a calculable "cost per execution" — the total inference cost required to complete one full cycle of the workflow from input to final output. This number is the atomic unit of AI financial governance. It is the equivalent of "cost of goods sold" in manufacturing — the direct variable cost that determines whether each unit of output is profitable.

**Calculating Cost Per Execution:**

For any given workflow, the calculation requires:
1. Mapping every model call in the execution path (most workflows involve multiple inference steps).
2. Measuring the average token consumption per step (both input tokens and generated output tokens, which are typically priced differently).
3. Applying the per-token pricing of the model used at each step.
4. Adding infrastructure costs (embedding generation, vector database queries, orchestration compute, API gateway overhead).
5. Summing across all steps to produce the total cost per single execution.

**Example: Customer Support Triage Workflow (Unoptimised)**

| Step | Model Used | Avg Input Tokens | Avg Output Tokens | Cost Per Execution |
|---|---|---|---|---|
| Query classification | Frontier model | 280 | 40 | $0.006600 |
| Context retrieval + embedding | Embedding model | 1,200 | — | $0.000120 |
| Response generation | Frontier model | 3,400 | 1,800 | $0.159000 |
| Quality validation | Frontier model | 2,200 | 150 | $0.042000 |
| **Total per execution** | | | | **$0.207720** |

At 80,000 executions per month: **$16,618/month** ($199,000 annually).

**The Same Workflow — Optimised with Tiered Routing:**

| Step | Model Used | Avg Input Tokens | Avg Output Tokens | Cost Per Execution |
|---|---|---|---|---|
| Query classification | Small language model | 280 | 40 | $0.000048 |
| Complexity routing decision | Small language model | 150 | 20 | $0.000026 |
| Context retrieval + embedding | Embedding model | 1,200 | — | $0.000120 |
| Response generation (simple — 60% of volume) | Small language model | 1,800 | 600 | $0.000360 |
| Response generation (complex — 40% of volume) | Frontier model | 3,400 | 1,800 | $0.159000 |
| Quality validation | Small language model | 800 | 100 | $0.000135 |
| **Blended average per execution** | | | | **$0.064089** |

At 80,000 executions per month: **$5,127/month** ($61,500 annually).

**Savings: $137,500 annually — a 69% reduction — with no measurable degradation in output quality for the 60% of queries routed to the lightweight tier.**

This is the margin math that most enterprises are currently failing to perform. Not because it is technically difficult — the calculation is straightforward arithmetic. But because no one has framed inference as a cost centre that requires optimisation. No one has assigned accountability for token efficiency. No one has asked: "What is the cheapest model that produces an acceptable output for this specific task type?"

**The Critical Ratio: Cost Per Execution vs Revenue Per Execution**

For any customer-facing workflow, a key health metric is the ratio between what a single execution costs and what value it generates. If a customer support interaction costs $0.21 in inference and prevents a $240 monthly subscription cancellation, the economics are excellent. If it costs $0.21 and resolves a query that would have been answered by the FAQ page anyway, the economics are wasteful.

This ratio must be calculated, tracked, and optimised for every workflow that consumes significant inference budget. When the ratio deteriorates — either because costs rise (more tokens consumed) or value decreases (lower-impact queries entering the pipeline) — it signals a routing problem that requires intervention.

### 7.3 The Optimisation Playbook: When to Deploy Which Model

Not all inference is equal. A password reset query and a complex legal contract analysis both consume tokens — but they require radically different levels of model sophistication. Routing both through the same frontier model is the AI equivalent of sending every letter by express courier — technically it works, but you are paying for speed and capability you do not need for the majority of shipments.

The enterprises that treat all inference identically are overspending dramatically. The solution is a classification-first architecture that evaluates each incoming task and routes it to the cheapest model capable of producing an acceptable output.

**The Task Complexity Routing Matrix:**

| Task Characteristic | Recommended Model Tier | Rationale | Cost Differential vs Frontier |
|---|---|---|---|
| Rule-based, deterministic, narrow vocabulary | Tier 1: Small/specialist model | Frontier capability is irrelevant; task has single correct answer | 95-99% cheaper |
| Pattern matching with moderate context | Tier 2: Mid-range model | Adequate comprehension at fraction of cost | 70-85% cheaper |
| Multi-step reasoning, ambiguous input | Tier 3: Frontier model | Required for accuracy; cheaper models produce errors | Baseline |
| Creative generation, nuanced tone | Tier 3: Frontier model | Quality degradation at lower tiers is commercially visible | Baseline |
| Classification, routing, entity extraction | Tier 1: Small/specialist model | Trivial cognitive load; over-engineering adds only cost | 95-99% cheaper |
| Summarisation of structured documents | Tier 2: Mid-range model | Standard patterns; frontier adds marginal value | 70-85% cheaper |
| Novel scenarios with no training precedent | Tier 3: Frontier model | Only option with sufficient generalisation capability | Baseline |
| Repetitive templates with variable fill | Tier 1: Fine-tuned specialist | Narrow task, high volume — fine tuning amortises quickly | 90-98% cheaper |

**The Three-Tier Architecture in Practice:**

**Tier 1: Lightweight and Specialist Models ($0.10 to $0.60 per million tokens)**

Purpose: classification, routing, entity extraction, FAQ responses, structured data transformation, template completion, and any task where the correct output can be defined with high precision and the input space is bounded.

These models are fast (10-50ms response time), cheap (negligible per-execution cost even at high volume), and sufficient for an estimated 50-65% of enterprise inference tasks. They are the workhorses that handle volume. Their limitations — narrow scope, inability to handle genuinely novel inputs, brittleness outside their training distribution — are irrelevant for the tasks they serve, because those tasks are definitionally narrow, predictable, and bounded.

**Tier 2: Mid-Range Models ($1.00 to $5.00 per million tokens)**

Purpose: summarisation, moderate reasoning, content generation within templates, document analysis, sentiment analysis with nuance, and tasks requiring contextual comprehension beyond simple pattern matching but not demanding cutting-edge reasoning capability.

These models serve approximately 20-30% of enterprise tasks. They represent the "good enough" tier — capable of producing commercially acceptable outputs for tasks that require comprehension but not brilliance. The quality difference between Tier 2 and Tier 3 for these tasks is typically imperceptible to the end consumer or downstream system.

**Tier 3: Frontier Models ($10.00 to $60.00+ per million tokens)**

Purpose: complex multi-step reasoning, novel scenarios outside training distribution, high-stakes outputs where any quality degradation carries commercial or legal risk, creative work requiring originality, and genuinely ambiguous inputs where the "correct" answer is not deterministic.

These models serve only 15-25% of enterprise inference volume — but often represent 70-80% of total cost due to their per-token pricing. The governance discipline is to ensure they are deployed exclusively where cheaper alternatives produce measurably worse outcomes — not as a default for convenience.

**The Routing Classifier:**

The routing logic between tiers should itself be handled by a Tier 1 model — a lightweight classifier trained specifically to evaluate incoming requests and assign them to the appropriate processing tier. This classifier examines query complexity signals: input length, vocabulary specificity, presence of ambiguity markers, historical task-type classification, and the criticality level of the workflow.

The cost of this routing step is negligible — typically $0.00003 to $0.00008 per request. The savings it produces are substantial — typically reducing total inference spend by 55-70% with no measurable quality degradation on correctly routed tasks.

**The Cache Layer:**

A frequently overlooked optimisation: many enterprise queries are semantically identical or near-identical to queries previously processed. "How do I reset my password?" is asked 400 times per month in slightly different phrasings. Processing each instance through a model — even a Tier 1 model — is wasteful when the answer is identical every time.

A semantic cache layer identifies incoming queries that match previously processed queries above a similarity threshold and returns the cached response directly — at zero inference cost. For high-volume customer service operations, caching can eliminate 20-35% of total inference requests entirely.

### 7.4 Corporate Resource Allocation: Setting Compute Quotas Across the Enterprise

In a traditional enterprise, the CFO allocates departmental budgets annually based on historical spend, growth projections, and strategic priority. In an AI-native enterprise, inference consumption must be governed with the same discipline — but with greater granularity, shorter feedback cycles, and a fundamentally different optimisation philosophy.

The challenge is that departments will consume as much inference as they are given access to — because the marginal cost of "asking the AI" appears zero from the user's perspective. Without governance, every team will default to the most capable (and most expensive) model for every task, because there is no local incentive to optimise. The cost is invisible to them. It appears only on the consolidated cloud bill — by which point the money has been spent.

**The Compute Quota Framework:**

**Step 1: Establish Workflow-Level Cost Visibility**

Every autonomous workflow must have a measured, attributed cost per execution. This is non-negotiable foundational infrastructure. Without it, optimisation is impossible — you are flying blind. The telemetry must capture: which model was called, how many tokens were consumed (input and output separately), what the per-token cost was at the time of invocation, and which department/function/workflow initiated the request.

If you cannot tell the CFO exactly how much a single execution of your customer onboarding workflow costs — broken down by step — you do not have financial governance. You have a cloud bill with a number on it.

**Step 2: Set Departmental Inference Budgets**

Allocate monthly inference budgets to each department based on:
- **Expected execution volume** — forecast from historical patterns and business growth projections.
- **Strategic priority weighting** — functions driving revenue growth or competitive differentiation may warrant higher per-execution spend than back-office functions processing internal administrative tasks.
- **Optimisation maturity credit** — departments that have already implemented tiered routing, caching, and cost-per-execution tracking should be rewarded (not penalised with reduced budgets) for demonstrated efficiency. Their savings fund innovation exploration, not budget cuts.
- **Quality criticality tier** — customer-facing functions where output quality directly impacts revenue retention warrant higher model allocation than internal operational functions where "good enough" is genuinely acceptable.

**Step 3: Implement Budget Alerting and Throttling**

Automated alerts at 70%, 85%, and 95% of monthly allocation — sent to the department head and the CFO's office simultaneously. At 100% consumption:
- Non-critical workflows are automatically throttled (queued for next billing cycle or routed to cheaper models with quality degradation acknowledged).
- Revenue-critical workflows continue unthrottled but are flagged for immediate leadership review and root-cause analysis.
- Compliance-required workflows are exempt from throttling entirely — regulatory obligations cannot be deferred by budget constraints.

**Step 4: Monthly Optimisation Review**

Each department presents its inference economics monthly to a cross-functional governance forum (CFO, CTO, and department leadership):
- Cost-per-execution trend: is it decreasing over time as routing matures and caching accumulates? If not, why?
- Volume vs budget variance: did actual usage match forecast? What drove any deviation?
- Tier distribution analysis: what percentage of queries hit Tier 3 that could have been adequately served by Tier 1 or Tier 2? This is the single most common source of waste.
- Identified optimisation opportunities for the next cycle: which workflows have not yet implemented routing? Where could caching reduce volume?
- New model market evaluation: have cheaper alternatives emerged since last month that could serve current Tier 2 or Tier 3 workloads?

**Step 5: Separate Innovation from Production Budgets**

This separation is critical and frequently neglected. Production inference budgets (predictable, optimised, governed) must be managed separately from innovation exploration budgets (unpredictable, experimental, learning-oriented).

Production budgets are held to strict cost-per-execution targets with accountability for efficiency. They are the operational engine — and they must be run lean.

Innovation budgets are evaluated on learning velocity and discovery value, not execution efficiency. Teams exploring new AI applications, testing new model capabilities, or prototyping novel workflows need room to experiment without the constraint of per-token optimisation. However, innovation budgets must have defined sunset clauses — a maximum duration after which the exploration must either demonstrate sufficient value to justify promotion to production (with full cost governance), or be terminated.

Without this separation, one of two failure modes emerges:
- Innovation is strangled by production efficiency metrics (new ideas never get tested because they look expensive in their experimental phase).
- Production costs spiral because experimental workloads run indefinitely without ever being held accountable for economics (the prototype that was "just for testing" becomes a permanent cost centre that no one governs).

---

## Executive Summary

> - AI inference is not a generic cloud cost. It is a granular, dynamic operational expenditure that varies with real time consumption and must be managed with the same financial discipline as any other variable cost that directly impacts margin.
> - Every workflow has a calculable "cost per execution" — the atomic unit of AI financial governance. This number must be measured, tracked, and optimised for every workflow consuming significant inference budget. If you cannot state this number, you have no visibility.
> - Not all inference requires the same model capability. A three-tier routing architecture (lightweight → mid-range → frontier) combined with semantic caching can reduce total inference costs by 55-70% without measurable quality degradation — by reserving expensive frontier models exclusively for the 15-25% of tasks that genuinely require their capabilities.
> - Compute quotas must be allocated at department level with monthly review cycles, automated alerting and throttling, and clear separation between production efficiency budgets and innovation exploration budgets. Without governance, departments will default to maximum-cost processing for every task.
> - The enterprise that manages inference as a precision financial instrument extracts maximum capability at minimum cost. The enterprise that treats it as a background IT expense will discover margin erosion through an alarming invoice — and by then, months of waste will be unrecoverable.

---

## Monday Morning Action Items

1. **Calculate your cost per execution for your top five inference-consuming workflows.** If you cannot produce this number today — broken down by model call, token volume, and per-step attribution — commission your engineering team to instrument token tracking and cost attribution telemetry immediately. Set a 30-day deadline. You cannot optimise what you cannot measure, and every day without measurement is a day of invisible waste.

2. **Identify your single most expensive model misallocation.** Audit your current production workflows and find the highest-volume function that routes all traffic through a frontier model regardless of task complexity. Sample 100 recent executions and classify each by whether a Tier 1 or Tier 2 model could have produced an equivalent output. Calculate the annual savings if the percentage that could be downtiered were routed appropriately. This number will be large enough to justify the engineering investment in routing infrastructure.

3. **Implement a three-tier model routing architecture.** Define which model tier serves which task type across your enterprise. Deploy a lightweight routing classifier that evaluates incoming requests based on complexity signals and directs them to the cheapest adequate model. Add a semantic cache layer that intercepts repeated queries and returns stored responses at zero inference cost. Measure the before-and-after cost per execution. Target a 50%+ reduction in total inference spend within 90 days of deployment.

4. **Establish departmental inference budgets for next quarter.** Work with your CFO to allocate monthly compute quotas to each department consuming AI inference — based on volume forecasts, strategic priority, and quality criticality tiers. Implement automated alerting at 70%, 85%, and 95% consumption thresholds. Schedule monthly optimisation reviews with department heads presenting cost-per-execution trends, tier distribution analysis, and identified savings opportunities. Separate innovation exploration budgets from production budgets with explicit sunset clauses.
