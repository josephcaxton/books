# Chapter 2: From Cloud Architecture to GenAI Architecture

If you have designed production systems on AWS, you already hold most of what you need to architect Generative AI (GenAI) systems. The instinct to treat GenAI as an entirely new discipline, unrelated to everything that came before, is misleading and quietly expensive. It leads teams to ignore the cloud architecture skills that transfer directly, and to underestimate the few concerns that are genuinely new.

This chapter is a bridge. It is written for the architect who understands VPCs, IAM, containers, functions and API design, and who now needs to reason about foundation models, retrieval, agents and AI governance. The goal is to establish clearly what carries over, what is new, and how to hold both in mind when reading the patterns that follow.

---

## 2.1 What transfers from VPC, IAM, ECS, Lambda and API Gateway

A large part of a GenAI system is ordinary cloud architecture, and your existing judgement applies without modification.

**Networking still governs where traffic flows.** A GenAI workload runs in a VPC, uses subnets and route tables, and reaches AWS services either across the public internet or through private paths. The decision to keep inference traffic on a private path using VPC endpoints is the same class of decision you already make for any sensitive service. The fact that the service on the other end is a foundation model does not change the networking reasoning.

**Identity still governs who may do what.** IAM roles, least privilege and short lived credentials apply directly. A component that calls a model needs a role scoped to exactly the actions it requires, no more. If anything, identity discipline matters more in GenAI, because the components you are authorising may act with a degree of autonomy.

**Compute still runs somewhere.** The application layer around a model, the API that receives a user request, the service that assembles context, the process that calls the model, runs on the same primitives you already use: Lambda for event driven and request driven work, containers on ECS or EKS for longer lived services, and so on. Choosing between them involves the familiar trade-offs of latency, concurrency, cold starts, operational overhead and cost.

**API design still governs contracts and boundaries.** Exposing a GenAI capability behind API Gateway, applying throttling, authentication and request validation, is the same pattern you would apply to any internal service. The foundation model sits behind that boundary as a dependency.

The practical implication is reassuring: you do not start from nothing. The scaffolding of a GenAI system, its network, identity, compute and interfaces, is cloud architecture you already know how to do well.

---

## 2.2 What is genuinely new: context, probabilistic behaviour and autonomy

The parts that are new are concentrated, and they are what make GenAI architecture distinct.

**Context is a first class input.** A traditional service behaves according to its code and its data. A foundation model behaves according to the context it is given at inference time: the instruction, the retrieved information, the conversation so far and any tools it may call. Much of GenAI architecture is the discipline of assembling the right context, from the right sources, for the right identity, at the right moment. Retrieval, grounding and memory are all mechanisms for managing context. This has no direct equivalent in most conventional systems.

**Behaviour is probabilistic, not deterministic.** A function called twice with the same input returns the same output. A foundation model may not. It generates output by probabilistic inference, which means the same request can produce different responses, and some responses may be plausible but wrong. This changes how you design for correctness. You cannot assume a fixed output contract without enforcing one, you cannot assume the model will always stay within scope without controls, and you must design evaluation as an ongoing activity rather than a one time test. Determinism, where you need it, becomes something you engineer around the model rather than something you inherit from it.

**Components can act with autonomy.** A conventional service does what it is told. An agent decides what to do: it may choose which tool to invoke, in what order, and when it has finished. This is a genuine shift in the trust model. An autonomous component with access to enterprise systems is a component whose authority you must bound deliberately, because the blast radius of an agent acting incorrectly is larger than that of a fixed workflow. Controlled autonomy, rather than maximal autonomy, becomes an architectural objective in its own right.

These three, context, probabilistic behaviour and autonomy, are the source of most of what feels unfamiliar about GenAI architecture. Nearly every new pattern in this book exists to manage one of them.

---

## 2.3 New concerns: model selection, data governance and AI specific operational risk

Beyond the underlying mechanics, GenAI introduces concerns that sit on top of familiar cloud architecture and require deliberate decisions.

**Model selection becomes an architectural variable.** In a conventional system you rarely choose between interchangeable compute engines at request time. In GenAI, different models offer different capability, latency and cost, and the right choice may vary by request. Whether model selection is fixed or routed, and where that decision is made, is an architectural concern rather than an implementation detail. It is treated as its own pattern later in the book.

**Data governance becomes sharper and more consequential.** Grounding a model in enterprise data means data flows into inference, and possibly into retrieval indexes, logs and caches. Who owns that data, who is permitted to retrieve it, whether one tenant can reach another tenant's information, and where the data is allowed to reside, are questions that must be answered in the architecture, not assumed. The controls are familiar, IAM, encryption, isolation, but the flows are new, and a careless retrieval design can leak data in ways a traditional application would not.

**Operational risk takes AI specific forms.** Alongside the usual failure modes, GenAI systems face concerns such as prompt injection, where untrusted input attempts to subvert the instruction given to the model; data leakage through retrieval or logging; excessive agency, where an autonomous component does more than intended; and quality regression, where output degrades without any error being raised. These are addressed properly in the security and operations parts of the book. Here the point is only that they are real, specific and must be reasoned about in terms of attack surface, likelihood, impact and control, not through alarm.

---

## 2.4 A mental bridge for the experienced AWS architect

A simple way to hold all of this together is to separate what you already know from what you must add.

Think of a GenAI system as a conventional cloud system with three additions:

- an **inference capability** that behaves probabilistically rather than deterministically;
- a **context supply chain** that assembles and grounds what the model sees; and
- optionally, **autonomous components** that decide and act rather than simply respond.

Everything else, the network, the identity model, the compute, the APIs, the observability backbone, is architecture you have built before. The new work is to wrap the three additions in the same rigour you already apply to conventional systems: bound their authority, control their inputs, define their behaviour under failure, make them observable, and understand their cost.

Two habits from cloud architecture transfer especially well. First, thinking in terms of the control plane and the data plane: in GenAI the control plane is where access, policy and routing decisions are made, and the data plane is where inference and retrieval actually occur. Keeping them distinct clarifies many designs. Second, thinking in terms of blast radius: the question "what can this fail into, and how far does the damage spread" is exactly the right question to ask of a model dependency, a retrieval source or an agent.

If you already ask those questions of your cloud systems, you are most of the way to asking them of your AI systems.

---

## 2.5 How to read the rest of this book from that starting point

With that bridge in place, the rest of the book will make more sense, and you can read it more efficiently.

Where a chapter discusses networking, identity, isolation or resilience, read it as an extension of what you already know, applied to the specific shape of GenAI workloads. You will not find lengthy reintroductions of VPCs or IAM, because the audience is assumed to have that foundation. What you will find is how those familiar controls apply when the workload includes a probabilistic model, a context supply chain and possibly autonomous components.

Where a chapter discusses context, retrieval, model routing, agents or evaluation, read it as the genuinely new material. These are the areas where GenAI architecture departs from convention, and they deserve closer attention precisely because your existing intuition covers them least.

Throughout, the recurring instruction from Chapter 1 still holds: design the system, not just the prompt. Your cloud architecture experience is what makes that possible. It is the reason you can look past the model to the system around it, which is exactly where the difficult and valuable decisions live.

> **📐 Architect's Verdict**
>
> GenAI architecture is not a replacement for cloud architecture; it is cloud architecture with three additions: probabilistic inference, a context supply chain, and optional autonomy. Treat the familiar parts with the discipline you already have, and reserve your fresh attention for the parts that are genuinely new. An experienced AWS architect is not starting over. They are extending a practice they already understand into a domain that rewards the same rigour.
