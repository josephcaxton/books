# Chapter 7: The Inference Budget

## Part III: Executive Decision Frameworks

---

## The Executive Vignette

A mid-market SaaS company in Boston had deployed AI across four operational functions: customer support triage, contract summarisation, lead scoring, and internal knowledge retrieval. Each function consumed tokens from the same frontier model API. There was no centralised tracking. No allocation logic. No cost per workflow visibility.

In Q3 2024, the CFO received a cloud bill showing a 340% increase in AI infrastructure costs compared to Q1. The engineering team could not explain which function was consuming what. The customer support workflow handling 80,000 tickets per month was routing every interaction, including trivial password reset requests, through the same $15 per million token frontier model used for complex contract analysis. A query that should have cost $0.002 was costing $0.14 because no one had built a routing layer that differentiated between a simple FAQ retrieval and a nuanced legal interpretation.

The company was burning $47,000 per month on inference for a support function whose output quality would have been identical at $6,200 per month — if someone had implemented a tiered model routing strategy that sent simple queries to a lightweight model and reserved the frontier model for genuine complexity.

No one had. Because no one was managing inference as a budget. It was treated as a generic cloud cost, invisible, unallocated, and unoptimised.

The inference budget is not a technical concern. It is a financial governance imperative. Every token consumed is a unit of operational expenditure. Every workflow that runs without cost visibility is a margin leak. And every enterprise that fails to manage inference economics will discover usually through an alarming invoice that AI capability without financial discipline is just expensive chaos.

---

## The Strategic Framework

### 7.1 The Shift from IT CapEx to Dynamic OpEx

Traditional enterprise IT budgeting operates on a capital expenditure model: you purchase software licences, hardware infrastructure, and implementation services upfront. Costs are amortised over three to five years. Budgets are set annually. Consumption is largely static, the licence costs the same whether you use it intensively or barely at all.

AI-native infrastructure operates on an entirely different financial model: **dynamic operational expenditure that varies with consumption in real time.** Every API call, every token processed, every inference request carries a direct, measurable cost. Usage spikes create cost spikes. Efficiency gains create immediate savings.

| Dimension | Traditional IT (CapEx) | AI-Native Infrastructure (Dynamic OpEx) |
|---|---|---|
| Cost trigger | Purchase event | Every inference request |
| Cost variability | Fixed over licence period | Fluctuates with usage volume |
| Budget predictability | High (static commitments) | Moderate (requires forecasting) |
| Waste visibility | Low (licence paid regardless of use) | High (every token is traceable) |
| Optimisation lever | Negotiate better licence terms | Route, throttle, and tier intelligently |
| Cost attribution | Allocated to IT department | Attributable to specific workflows and departments |

This shift has profound implications for financial governance. The CFO can no longer set an annual IT budget and forget it. AI costs are living, breathing operational expenses that move with the business every day. They require the same granular attention that a logistics company gives to fuel costs or a manufacturer gives to raw material pricing.

The enterprises that treat inference as a generic line item will haemorrhage margin. The enterprises that manage it as a precision instrument will extract maximum capability at minimum cost.

### 7.2 Token Economics and Margin Math: The Cost Per Inference Framework

Every AI-powered workflow has a calculable "cost per execution" — the total inference cost required to complete one full cycle of the workflow from input to output. This number is the atomic unit of AI financial governance.

**Calculating Cost Per Execution:**

For a given workflow:
1. Count the total tokens consumed per execution (input tokens + output tokens across all model calls in the workflow).
2. Multiply by the per token cost of the model(s) used.
3. Add any additional compute costs (embedding generation, vector database queries, orchestration overhead).
4. Sum across all steps in the workflow to produce the total cost per execution.

**Example: Customer Support Triage Workflow**

| Step | Model Used | Avg Tokens | Cost Per 1M Tokens | Cost Per Execution |
|---|---|---|---|---|
| Query classification | Small language model | 320 | $0.15 | $0.000048 |
| Context retrieval | Embedding model | 1,200 | $0.10 | $0.000120 |
| Response generation | Frontier model | 2,800 | $15.00 | $0.042000 |
| Quality validation | Small language model | 600 | $0.15 | $0.000090 |
| **Total per execution** | | | | **$0.042258** |

At 80,000 executions per month: **$3,381/month**.

Now apply the critical question: **does every step require the model assigned to it?**

In the example above, response generation consumes 99.4% of the total cost. If 60% of incoming queries are simple FAQs that a small language model could handle with equivalent accuracy, routing those to a $0.15/million model instead of the $15/million model would reduce monthly cost to approximately $1,420 — a 58% reduction with zero quality degradation for the queries that were rerouted.

This is the margin math that most enterprises are currently failing to perform.

### 7.3 The Optimisation Playbook: When to Deploy Which Model

Not all inference is equal. A password reset query and a complex legal contract analysis both consume tokens — but they require radically different levels of model sophistication. The enterprises that treat all inference the same are overspending dramatically.

The routing decision matrix:

| Task Characteristic | Recommended Model Tier | Rationale |
|---|---|---|
| Rule based, deterministic, narrow vocabulary | Small language model or fine tuned specialist | Cheap, fast, accurate within defined scope |
| Pattern matching with moderate context | Mid-tier model or fine tuned domain model | Balances cost against contextual comprehension |
| Multi-step reasoning, ambiguous input, novel scenarios | Frontier model | Required for accuracy; cheaper models produce unacceptable error rates |
| Creative generation, nuanced tone, high stakes communication | Frontier model | Quality degradation at lower tiers is commercially unacceptable |
| Classification, routing, metadata extraction | Small language model | Trivial cognitive load; frontier models are massive overkill |
| Summarisation of well structured documents | Mid-tier model | Adequate comprehension at 90%+ cost reduction vs frontier |

**The Three Tier Architecture:**

The AI-native enterprise should operate a minimum of three model tiers:

**Tier 1: Lightweight / Specialist Models ($0.10 to $0.60 per million tokens)**
- For: classification, routing, entity extraction, FAQ responses, structured data transformation.
- Characteristic: fast, cheap, narrow scope, high confidence within defined boundaries.

**Tier 2: Mid-Range Models ($1.00 to $5.00 per million tokens)**
- For: summarisation, moderate reasoning, content generation with templates, document analysis.
- Characteristic: broader context window, adequate nuance, significant cost reduction vs frontier.

**Tier 3: Frontier Models ($10.00 to $30.00+ per million tokens)**
- For: complex reasoning, novel scenarios, high stakes outputs, creative work, ambiguous inputs.
- Characteristic: maximum capability, maximum cost. Should be reserved exclusively for tasks where cheaper alternatives produce measurably worse outcomes.

The routing logic between tiers can itself be handled by a Tier 1 model — a lightweight classifier that evaluates incoming requests and routes them to the appropriate tier based on complexity signals. The cost of this routing step is negligible. The savings it produces are substantial.

### 7.4 Corporate Resource Allocation: Setting Compute Quotas Across the Enterprise

In a traditional enterprise, the CFO allocates departmental budgets annually. In an AI-native enterprise, inference consumption must be governed with the same discipline — but with greater granularity and shorter feedback cycles.

**The Compute Quota Framework:**

**Step 1: Establish Workflow Level Cost Visibility**

Every autonomous workflow must have a measurable, attributed cost per execution. No workflow should operate without cost tracking. If you cannot tell the CFO exactly how much a single execution of your customer onboarding workflow costs, you do not have financial governance — you have a cloud bill.

**Step 2: Set Departmental Inference Budgets**

Allocate monthly inference budgets to each department based on:
- Expected execution volume (forecast from historical patterns).
- Strategic priority (functions driving revenue growth may warrant higher per execution spend than back office functions).
- Optimisation maturity (departments that have already implemented tiered routing should receive budget credit for demonstrated efficiency).

**Step 3: Implement Budget Alerting and Throttling**

Automated alerts at 70%, 85%, and 95% of monthly allocation. At 100%, non-critical workflows are throttled or queued until the next budget cycle. Critical workflows (revenue impacting, compliance required) are exempt from throttling but flagged for immediate leadership review.

**Step 4: Monthly Optimisation Review**

Each department presents its inference economics monthly:
- Cost per execution trend (is it decreasing as routing matures?).
- Volume vs budget variance (did actual usage match forecast?).
- Tier distribution (what percentage of queries hit Tier 3 that could have been served by Tier 1?).
- Identified optimisation opportunities for next cycle.

**Step 5: Innovation vs Production Budgets**

Separate inference budgets for production workloads (predictable, optimised, governed) from innovation exploration (unpredictable, experimental, learning). Production budgets are held to strict cost per execution targets. Innovation budgets are evaluated on learning velocity, not efficiency — with a defined sunset clause that forces either promotion to production or termination.

---

## Executive Summary

> - AI inference is not a generic cloud cost. It is a granular operational expenditure that varies with consumption and must be managed with the same financial discipline as any other variable cost driver.
> - Every workflow has a calculable "cost per execution." This is the atomic unit of AI financial governance. If you cannot state this number for your critical workflows, you have no visibility.
> - Not all inference requires the same model. A three tier routing architecture (lightweight → mid-range → frontier) can reduce costs by 50% to 70% without quality degradation — by reserving expensive models exclusively for tasks that genuinely require them.
> - Compute quotas must be allocated at department level with monthly review cycles, automated alerting, and clear separation between production efficiency budgets and innovation exploration budgets.
> - The enterprise that manages inference as a precision instrument extracts maximum capability at minimum cost. The enterprise that ignores it will discover margin erosion through an alarming invoice.

---

## Monday Morning Action Items

1. **Calculate your cost per execution for your top five workflows.** If you cannot produce this number today, commission your engineering team to instrument token tracking immediately. You cannot optimise what you cannot measure.

2. **Identify your most expensive model misallocation.** Audit your current workflows and find the single highest volume function that is routing all traffic through a frontier model regardless of query complexity. Estimate the savings if 60% of that traffic were routed to a Tier 1 model.

3. **Implement a three tier model routing architecture.** Define which model tier serves which task type across your enterprise. Deploy a lightweight routing classifier that evaluates incoming requests and directs them to the cheapest adequate model. Measure the before and after cost per execution.

4. **Establish departmental inference budgets for next quarter.** Work with your CFO to allocate monthly compute quotas to each department consuming AI inference. Implement automated alerting at 70%, 85%, and 95% thresholds. Schedule monthly optimisation reviews starting immediately.
