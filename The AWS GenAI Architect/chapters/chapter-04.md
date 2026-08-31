# Chapter 4: Foundation Models as an Architectural Concern

An architect does not need to know how to train a foundation model, any more than a cloud architect needs to know how to fabricate a processor. What an architect does need is an accurate mental model of how a foundation model behaves as a component in a system: what it consumes, what it produces, how it fails, and which of its properties become constraints on the architecture around it.

This chapter deliberately avoids the mathematics of machine learning and the internals of model training. Those belong to a different book. Here the model is treated as an architectural building block, and the questions are the ones an architect must answer: what does this component demand of the system, and what does it offer in return?

---

## 4.1 What an architect actually needs to know about foundation models

A foundation model is a large, pre-trained model that performs inference over the input it is given, producing output one unit at a time based on learned statistical patterns. For architectural purposes, four properties matter more than any detail of how the model was built.

**It is a dependency, not a library.** A foundation model is an external capability your system calls, with a latency, a cost, a rate limit and an availability profile. It behaves like a remote service dependency, and it should be designed around as one, with timeouts, retries, fallbacks and monitoring, rather than treated as a local, always available function.

**Its behaviour is shaped by input at call time.** Unlike conventional code, the model has no fixed behaviour of its own that you configure once. What it does is largely determined by the context supplied with each request. This makes the assembly of that context a central architectural responsibility, not an afterthought.

**Its output is probabilistic.** The same input may yield different output, and confident output may still be incorrect. The architecture cannot assume correctness; it must create the conditions for correctness through grounding, constraint and evaluation.

**Its knowledge is bounded and frozen.** A model knows what its training captured, up to a point in time, and nothing of your enterprise unless you supply it. Anything current, private or authoritative must be provided at inference time. This single fact is the reason retrieval exists as an architectural concern.

Hold these four properties in mind and most architectural decisions about models follow naturally. Ignore them and the system will be surprised by behaviour that was, in fact, entirely predictable.

---

## 4.2 Inference, context, tokens and embeddings as system properties

A handful of concepts recur throughout GenAI architecture. They are worth understanding not as machine learning theory but as system properties that impose real constraints.

**Inference** is the act of the model producing output from input. It costs money and time, and its latency tends to scale with the amount of output generated. Because inference is the expensive step, much of GenAI architecture is concerned with invoking it efficiently: sending only what is needed, avoiding needless calls, and streaming output so that users perceive responsiveness even when total generation takes time.

**Context** is everything supplied to the model for a given inference: the instruction, any retrieved information, the conversation history and the description of any tools available. Context is finite. Every model has a maximum context size, and filling it has both a cost and, often, a quality consequence, since a model given too much irrelevant material may respond less accurately. Managing context, deciding what to include and what to leave out, is a design activity with direct effects on cost, latency and quality.

**Tokens** are the units in which models process text and in which their usage is measured and priced. A token is a fragment of text, smaller than a typical word. The architectural significance is simple and important: tokens are the currency of GenAI. Input tokens and output tokens both cost, context limits are expressed in tokens, and an architecture that is careless with tokens is careless with money. Understanding that every retrieved document, every conversation turn and every verbose instruction consumes tokens is the beginning of cost aware design.

**Embeddings** are numerical representations of meaning, produced by a model, that allow text to be compared by similarity rather than by exact match. They are the mechanism that makes retrieval possible: content and queries are converted to embeddings so that relevant material can be found. Architecturally, embeddings introduce their own considerations, they must be generated, stored in a vector store, kept consistent with the content they represent, and refreshed when content changes. They are a system of their own, addressed in the retrieval chapters.

None of these require mathematical depth to use well. They require respect as constraints: inference costs, context is finite, tokens are currency, and embeddings must be managed.

---

## 4.3 Capability, latency and cost as design inputs

When a model is treated as a component, three of its characteristics become direct inputs to design, and they trade against one another.

**Capability** is how well a model performs the task at hand. More capable models handle harder reasoning, longer context and more nuanced instructions, but capability is task specific: a model that excels at one task may be unnecessary for another. The architectural question is not "which model is best" in the abstract, but "which model is sufficient for this task", because paying for capability a task does not need is waste.

**Latency** is how quickly the model responds. More capable models are often slower, and a task with a strict latency requirement, an interactive assistant, say, may need a faster, lighter model even where a slower one would answer marginally better. Latency also depends on output length and on whether responses are streamed. It is a first order design input, not a detail to be measured after the fact.

**Cost** follows from model choice and token usage. A more capable model typically costs more per token, and a design that sends large contexts to expensive models at high volume can become commercially unsustainable regardless of how well it performs. Cost must be reasoned about at design time, in terms of tokens per request and requests per period, not discovered on the first invoice.

These three form a triangle of trade-offs. You rarely maximise all at once; you choose a balance appropriate to the task. This is precisely why model selection is not a one time decision but an architectural variable, and why routing between models, addressed later, exists as a pattern. The purpose of understanding capability, latency and cost here is to recognise them as the inputs that later decisions optimise.

---

## 4.4 Open weight versus proprietary models: an architectural view

Foundation models available on AWS include both proprietary models, accessed as a managed service, and open weight models, whose parameters are published and which can be deployed more flexibly. The choice between them is sometimes framed as ideological. Architecturally it is a set of trade-offs.

**Proprietary models accessed as a managed service** minimise operational burden. You call an endpoint; the provider handles the infrastructure, scaling and updates. You gain capability and simplicity, and you accept dependence on the provider's roadmap, pricing and terms, and less control over exactly where and how inference runs.

**Open weight models** offer control and flexibility. You can, in principle, host them yourself, customise them more deeply, and place inference precisely where your constraints require. You accept, in return, the operational responsibility of running model serving infrastructure, managing capacity and hardware, and owning the reliability and scaling that a managed service would otherwise provide.

The architectural view resists a universal answer. An organisation with strict control or residency requirements, the maturity to operate model serving, and a need for deep customisation may find open weight models justified. An organisation that values speed, simplicity and managed scaling, and whose requirements are met by available managed models, may find the proprietary route clearly preferable. Many enterprises use both, matching the model to the constraint. The decision belongs with the requirements of the specific workload, not with a general preference, and it should be revisited as those requirements change.

---

## 4.5 Grounding, determinism and the limits of model behaviour

An architect must design not only for what a model does well but for what it does not do, because much of the risk in GenAI systems arises at those limits.

**Grounding** is the practice of supplying a model with authoritative information at inference time so that its output rests on that information rather than on its frozen training. Grounding is the primary architectural response to two problems at once: the model's lack of current or private knowledge, and its tendency to produce plausible but unsupported output. A grounded system can also cite what it relied on, which matters for trust and audit. Grounding does not make a model infallible, but it materially narrows the gap between what the model says and what is true for your enterprise.

**Determinism** is largely absent by default, and where a system needs it, it must be engineered. If a downstream process requires structured, predictable output, the architecture must enforce that structure and validate it, rather than assume the model will always comply. Treating a probabilistic component as if it were deterministic is a common and avoidable source of production failure.

**The limits of model behaviour** must be designed around explicitly. A model may produce confident errors, may drift outside the scope you intended, may be influenced by instructions hidden in the content it is given, and may behave differently as it is updated over time. None of these are exotic; they are ordinary properties of the component. The appropriate response is architectural: ground the model in trusted data, constrain and validate its output, bound what it is permitted to do, treat untrusted input as data rather than instruction, and evaluate behaviour continuously rather than assuming it is fixed.

Understanding these limits is not pessimism about the technology. It is the same realism an architect applies to any dependency: know how it fails, and design so that its failure is contained.

> **📐 Architect's Verdict**
>
> Treat the foundation model as what it is: a probabilistic, externally provided dependency whose behaviour is shaped by the context you supply, whose knowledge is frozen and bounded, and whose usage is measured in tokens that cost money. Choose the model that is sufficient for the task rather than the most capable available, balance capability against latency and cost deliberately, and design around the model's limits with grounding, constraint and evaluation. The architect's job is not to admire the model. It is to build a system in which the model's strengths are used and its weaknesses are contained.
