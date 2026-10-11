# Chapter 2: From IT and Data Governance to AI Governance

If you have run IT governance, data governance, risk management or internal audit in a large organisation, you already hold most of what you need to govern Artificial Intelligence (AI). The instinct to treat AI governance as an entirely new discipline, unrelated to everything that came before, is misleading and quietly expensive. It leads teams to discard governance capabilities that transfer directly, and to underestimate the few concerns that are genuinely new.

This chapter is a bridge. It is written for the professional who understands policy, controls, risk registers, lines of defence and audit evidence, and who now needs to reason about model risk, probabilistic behaviour, autonomy and responsible AI. The goal is to establish clearly what carries over, what is new, and how to hold both in mind when reading the mechanisms that follow.

---

## 2.1 What transfers from IT governance, data governance, risk and audit

A large part of AI governance is ordinary governance, and your existing judgement applies without modification.

**Risk management still governs how you prioritise.** AI introduces new risks, but the discipline of identifying a risk, assessing likelihood and impact, assigning an owner, deciding on treatment and tracking it to closure is unchanged. A risk register that already handles operational, financial and regulatory risk extends naturally to AI risk. The subject is new; the method is not.

**Control design still governs how you reduce risk.** A control objective, a control that meets it, and evidence that the control operates are the same constructs you already use. Preventive, detective and corrective controls apply to AI exactly as they apply elsewhere. If anything, the discipline matters more in AI, because some risks are harder to see and the evidence is easier to omit.

**Accountability still rests on structures you have.** The three lines model, with the first line owning risk, the second providing oversight, and the third providing independent assurance, applies directly to AI. Committees, approval authorities, escalation paths and attestation are all mechanisms you already operate. AI governance reuses them rather than inventing a parallel hierarchy.

**Data governance still governs the raw material.** AI runs on data, and much of what makes AI risky is a data concern: provenance, quality, consent, residency, access and retention. An organisation with mature data governance already holds a large part of what responsible AI requires. The lineage and classification you maintain for data become foundations for governing the models trained on it.

The practical implication is reassuring: you do not start from nothing. The scaffolding of AI governance, its risk method, its control constructs, its accountability model and its data foundations, is governance you already know how to do well.

---

## 2.2 What is genuinely new: probabilistic behaviour, opacity, autonomy and continuous change

The parts that are new are concentrated, and they are what make AI governance distinct.

**Behaviour is probabilistic, not deterministic.** A conventional system behaves according to its rules; given the same input it produces the same output, and you can test it exhaustively against a specification. Many AI systems do not work this way. They generate output by probabilistic inference, so the same input can produce different results, and some results may be confident and wrong. This changes what assurance means. You cannot certify an AI system correct once and consider the question closed; you must evaluate its behaviour continuously and govern the uncertainty rather than assume it away.

**The system is often opaque.** A traditional control can be inspected: you can read the rule and see why a decision was made. Many models are not transparent in that way, which complicates every obligation that depends on explanation, from a fairness review to a regulator's request for the reason behind a decision. Opacity is not merely a technical inconvenience; it is a governance problem, because accountability requires the ability to explain, and explanation cannot be assumed.

**Components can act with autonomy.** A conventional system does what it is told. An AI agent may decide what to do: which tool to call, in what order, and when it is finished. This is a genuine shift in the control model. An autonomous component with access to enterprise systems is one whose authority must be bounded deliberately, because the consequence of it acting wrongly is larger than that of a fixed process. Governing autonomy, rather than permitting it by default, becomes an objective in its own right.

**The system changes continuously.** A governed application is relatively stable between releases. An AI system can change without a release: the data drifts, the world the model was trained on moves on, or a vendor updates the underlying model beneath you. Governance designed around a point in time approval does not survive this. The lifecycle must be governed as a continuous loop, not a gate passed once.

These four, probabilistic behaviour, opacity, autonomy and continuous change, are the source of most of what feels unfamiliar about AI governance. Nearly every mechanism in this book exists to manage one of them.

---

## 2.3 New concerns: model risk, data dependence and fast moving regulation

Beyond the underlying mechanics, AI introduces concerns that sit on top of familiar governance and require deliberate decisions.

**Model risk becomes a first class concern.** Some sectors, notably financial services, have governed model risk for years, but AI generalises the problem well beyond them. A model can be inaccurate, biased, unstable, or wrong in ways that are hard to detect, and the harm can reach customers, employees and the public. Model risk management, validation, monitoring and documentation, becomes a governance concern for organisations that never previously thought of themselves as model users.

**Data dependence sharpens existing data risk.** Because an AI system inherits the properties of the data it learns from, a data problem becomes a model problem and then a decision problem. Bias in historical data becomes bias in outcomes. A consent gap in training data becomes a legal exposure in deployment. The controls are familiar, classification, access, lineage, retention, but the consequences propagate further and are harder to reverse once a model is trained.

**Regulation is moving quickly and unevenly.** Conventional governance operates against relatively stable rules. AI regulation is being written now, differs by jurisdiction, and layers sector specific obligations on top of cross cutting ones. An organisation must track obligations that are in force, adopted, proposed and anticipated, and must build controls that can adapt as the rules settle. Governance that assumes a fixed regulatory baseline will be wrong within a year.

---

## 2.4 A mental bridge for the experienced governance professional

A simple way to hold all of this together is to separate what you already know from what you must add.

Think of an AI governed estate as a conventionally governed estate with three additions:

- **probabilistic components** whose behaviour must be evaluated continuously rather than certified once;
- a **data and model supply chain** whose provenance, quality and change you must track end to end; and
- optionally, **autonomous components** that decide and act rather than simply execute a defined process.

Everything else, the risk method, the control constructs, the three lines model, the audit evidence, the committees, is governance you have operated before. The new work is to wrap the three additions in the same rigour you already apply: bound their authority, control their inputs, define acceptable behaviour, make them monitorable, and evidence that they are controlled.

Two habits from established governance transfer especially well. First, thinking in terms of lines of defence: in AI the first line builds and runs the system, the second sets policy and reviews risk, and the third assures independently. Keeping those roles distinct clarifies many disputes about who decides. Second, thinking in terms of proportionality: the question "how much control does this risk actually justify" is exactly the right question to ask of an AI use case, and it guards against the two failure modes of governing everything equally or governing nothing at all.

If you already ask those questions of your organisation's risk, you are most of the way to asking them of its AI.

---

## 2.5 How to read the rest of this book from that starting point

With that bridge in place, the rest of the book will make more sense, and you can read it more efficiently.

Where a chapter discusses risk, accountability, policy, assurance or audit, read it as an extension of what you already know, applied to the specific shape of AI. You will not find lengthy reintroductions of the three lines model or the mechanics of a risk register, because the audience is assumed to have that foundation. What you will find is how those familiar constructs apply when the thing being governed behaves probabilistically, resists explanation, may act autonomously and changes without a release.

Where a chapter discusses model risk, evaluation, drift, explainability, human oversight or fast moving regulation, read it as the genuinely new material. These are the areas where AI governance departs from convention, and they deserve closer attention precisely because existing intuition covers them least.

Throughout, the recurring instruction from Chapter 1 still holds: govern the system, not just the statement. Your governance experience is what makes that possible. It is the reason you can look past the principles to the operating system around them, which is exactly where the difficult and valuable decisions live.

> **📐 Governance Verdict**
>
> AI governance is not a replacement for established governance; it is established governance with three additions: probabilistic behaviour that must be evaluated continuously, a data and model supply chain that must be tracked end to end, and optional autonomy that must be deliberately bounded. Treat the familiar parts with the discipline you already have, and reserve your fresh attention for the parts that are genuinely new. An experienced governance professional is not starting over. They are extending a practice they already understand into a domain that rewards the same rigour.
