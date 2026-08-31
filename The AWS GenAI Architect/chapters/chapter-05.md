# Chapter 5: Amazon Bedrock as an Architectural Building Block

Chapter 4 treated the foundation model as an architectural component in the abstract. This chapter grounds that abstraction in a specific AWS capability: Amazon Bedrock. The intent is not to catalogue Bedrock's features, and not to argue that Bedrock is the right choice for every situation. It is to understand what Bedrock provides architecturally, so that you can reason about where it fits in a system and what its use implies for the design around it.

Bedrock is best understood as the point at which the abstract concerns of the previous chapter, inference, context, tokens, model selection, meet a concrete, managed AWS surface. Treated that way, it becomes a building block whose properties you can design with, rather than a product to be adopted for its own sake.

---

## 5.1 Where Bedrock sits in an enterprise architecture

Amazon Bedrock provides access to a range of foundation models through a managed AWS service, with a common interface, integration with AWS identity and networking, and supporting capabilities such as retrieval and guardrails. In architectural terms, it sits at the boundary between your system and the models themselves.

This position has consequences. Because Bedrock is a managed AWS service, it inherits the parts of your architecture you already control through AWS: requests to it are authenticated and authorised through IAM, they can be kept on private network paths, and their usage is visible through the same operational surfaces as other AWS services. This is the practical realisation of the point made in Chapter 2, that much of a GenAI system is ordinary cloud architecture. Bedrock is deliberately shaped to be reached with the identity, networking and operational tools you already use.

Where Bedrock sits also tells you what it does not do for you. It provides access to models and several surrounding capabilities, but it does not decide your context strategy, your tenancy model, your routing policy or your governance. Those remain architectural responsibilities that you build around Bedrock. It is a building block, and the building is still yours to design.

For most enterprises, Bedrock occupies the data plane role described in Chapter 3: it is where inference actually happens. The control plane, where access, policy and routing decisions are made, is something you place in front of it, a theme that recurs when the AI Gateway pattern is introduced.

---

## 5.2 The Bedrock control plane and data plane

The control plane and data plane distinction applies within Bedrock itself, and keeping the two clear avoids a common category error.

The **Bedrock control plane** is concerned with management: which models are enabled for your account, what capacity arrangements are in place, how configurations such as guardrails or knowledge bases are defined. These are administrative actions, performed relatively infrequently, that shape what is available and under what terms.

The **Bedrock data plane** is concerned with use: submitting a request for inference and receiving a response, including streamed responses and requests that invoke retrieval or agents. These are the high frequency, latency sensitive, cost bearing operations that occur on every user interaction.

The distinction matters architecturally for several reasons. The two planes have different security profiles: administrative control over which models are enabled is a governance concern to be tightly restricted, whereas the ability to invoke inference is an operational permission granted more widely but still scoped per identity. They have different scaling and availability characteristics: the data plane must be designed for the volume and latency of production traffic, while the control plane is not on that hot path. And they map cleanly onto your own architecture: your control plane governs access to Bedrock's data plane, and your administrative processes govern Bedrock's control plane. When a responsibility seems ambiguous, classifying it as management or use usually places it correctly.

---

## 5.3 On demand and provisioned throughput as architectural choices

Bedrock offers more than one way to obtain inference capacity, and the choice is genuinely architectural because it affects cost, performance predictability and how the system behaves under load.

**On demand** capacity lets you invoke models and pay for what you use, without reserving capacity in advance. It suits variable, unpredictable or early stage workloads, where committing to fixed capacity would be premature. Its trade-off is that throughput is subject to shared limits, and a workload with demanding or spiky volume may encounter throttling that must be handled in the design.

**Provisioned throughput** reserves dedicated capacity for a model, providing more predictable performance and higher, more consistent throughput. It suits mature, high volume or latency sensitive workloads where predictability justifies commitment. Its trade-off is cost: you pay for the reserved capacity whether or not it is fully used, so it becomes economical only when utilisation is high and sustained.

The decision is not permanent, and it need not be uniform. A common trajectory is to begin on demand while volume and patterns are still being learned, then move high, steady workloads to provisioned throughput once the economics are clear, while leaving variable workloads on demand. The architectural point is to make this a deliberate, revisited decision driven by measured demand and cost, rather than a default chosen once and forgotten. It also has resilience implications, addressed later: how a system behaves when it approaches its throughput limits is part of its failure design, not a separate operational detail.

---

## 5.4 Regions, cross account inference and data residency

Because Bedrock is an AWS service, the familiar concerns of regions, account structure and data residency apply directly, and they carry particular weight in GenAI because inference involves sending data, sometimes sensitive data, to be processed.

**Regions** determine where inference occurs and where associated data is handled. Model availability can differ by region, and the region in which you invoke a model is where that processing takes place. For workloads with residency obligations, this is not a performance detail but a compliance one: the region must be chosen so that data is processed where it is permitted to be. Region choice also affects latency, since proximity to users and to the data being supplied as context matters.

**Cross account inference** arises naturally in the multi account enterprises described in Chapter 3. A request may originate in an application account while inference is served through configuration owned elsewhere, and the architecture must define which identity is used, how access is granted across account boundaries, and how usage is attributed back to the originating team. These are the same cross account access and connectivity questions you handle for other AWS services, applied to inference.

**Data residency and sovereignty** deserve explicit treatment because grounding and context supply mean enterprise data flows into inference, and potentially into logs, caches and retrieval indexes. An architecture that satisfies residency for its primary datastore but overlooks where inference occurs, or where prompts and responses are logged, has not actually satisfied residency. The discipline is to trace the data, all of it, including the context sent to the model and the records kept of the interaction, and confirm that every location is permitted. Later chapters on security and networking develop the controls; the point here is that Bedrock's use must be placed within your residency constraints deliberately.

---

## 5.5 Positioning Bedrock, AgentCore and surrounding AWS services

Bedrock does not stand alone. It sits among surrounding AWS services, and part of using it well is understanding what role each plays so that the system is composed coherently rather than assembled from whatever is available.

**Amazon Bedrock AgentCore** provides capabilities for building agentic systems, components that can decide and act, invoking tools and carrying out multi step work rather than simply returning a single response. AgentCore belongs to the agentic patterns developed later in the book; introduced here, it is enough to place it as the capability you reach for when a workload requires controlled autonomy rather than single turn inference, with all the additional trust and blast radius considerations that autonomy implies.

**Retrieval and knowledge capabilities** connect Bedrock to your data for grounding, turning the abstract need for context described in Chapter 4 into a concrete mechanism. These underpin the RAG and retrieval chapters.

**Guardrails** provide a means of applying content and policy controls to model interactions, a building block for the security and governance chapters, and an example of a control that is most valuable when applied consistently rather than reimplemented per application.

**The wider AWS estate**, identity, networking, storage, compute, observability, monitoring and cost management, provides the surrounding architecture. Bedrock is reached with IAM, connected through your network design, observed through your monitoring, and paid for through your cost management, exactly as the earlier chapters argued.

The architectural discipline is to treat each of these as a building block that answers a specific need, and to ask of each the same question: what problem does this solve in my system, and what does using it imply? That question, rather than the availability of a feature, is what should drive its inclusion.

> **📐 Architect's Verdict**
>
> Amazon Bedrock is best understood as a managed data plane for inference that integrates with the AWS identity, networking and operational tools you already use. It provides models and several surrounding capabilities; it does not provide your context strategy, tenancy model, routing policy or governance, which remain yours to design around it. Treat its choices, on demand or provisioned throughput, region and account placement, surrounding services, as deliberate architectural decisions driven by the workload's constraints. Bedrock is a strong building block. The building is still the architect's responsibility.
