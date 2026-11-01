# Appendix D: Glossary

This glossary defines the governance and AI terms used throughout the book, in the specific senses the book gives them. Where the book draws a distinction that is often blurred in practice, the glossary preserves it, because the distinction usually carries a governance consequence. Definitions are deliberately concise; the chapters develop them.

---

**Accountability.** The condition of a named person being answerable for an AI use case and its outcomes. Accountability cannot be collective, nor delegated to a process or a vendor. Distinct from responsibility, which may be shared among those who do the work. (Chapter 5)

**Agent.** An autonomous or semi autonomous AI component that selects and takes actions, such as calling a tool or taking a sequence of steps, rather than only producing a prediction or response. Described mechanically throughout: an agent selects actions by inference, it does not want or intend. (Chapter 19)

**Agentic workflow.** A structured process in which an AI component makes decisions about what to do, as distinct from a fixed, scripted workflow. (Chapter 19)

**AI governance.** The operating system, roles, decisions, controls, evidence, that delivers and assures responsible AI outcomes. Distinct from responsible AI, which names the outcomes themselves. The book's recurring instruction, govern the system not just the statement, turns on this distinction. (Chapter 1)

**Assurance.** Independent confirmation that controls actually operate as intended, as opposed to self assessment by those who run them. The basis on which an organisation can prove, rather than assert, that its governance works. (Chapter 17)

**Automation bias.** The human tendency to defer to a confident machine, especially under time pressure, which hollows out human oversight into rubber stamping unless the process is designed to resist it. (Chapter 15)

**Blast radius.** The extent of harm a wrong action or failure can cause before it is contained. A central concern for autonomous systems, where bounding the blast radius is a primary control. (Chapters 14, 19)

**Centralisation.** An arrangement in which a single function holds the authority and performs the governance work. Distinct from federation and distribution; the three must not be used interchangeably. (Chapters 3, 20)

**Classification.** The triage that assigns an AI use case to a risk tier, determining the strength of the controls that follow. The control plane of the governance system. (Chapter 4)

**Contestability.** A usable route by which a person affected by an automated decision can challenge it and reach a human able to change it. Distinct from disclosure and explanation. (Chapter 13)

**Control.** A specific, checkable action that reduces an identified risk and produces evidence that it operated. Distinct from a policy, which states a rule, and a principle, which states intent. (Chapter 6)

**Distribution.** An arrangement in which governance authority and work sit wholly with local units, with little or no common framework. At scale, usually indistinguishable from an absence of governance. Distinct from centralisation and federation. (Chapters 3, 20)

**Drift.** The gradual movement of a model's inputs or behaviour away from the conditions under which it was validated, causing silent degradation that raises no error. Detected by monitoring against the evaluation baseline. (Chapter 10)

**Evidence.** The durable record, produced as a control operates, that both supports assurance and demonstrates compliance. Captured as work happens rather than reconstructed on demand. (Chapters 6, 17)

**Explainability (explanation).** The provision of the basis of a decision in terms meaningful to the recipient. An explanation must be faithful to the model's actual basis, not a plausible fabrication. Distinct from disclosure and contestability. (Chapter 13)

**Fairness.** Comparable treatment or outcomes across the groups a decision affects, as defined for that decision. Because fairness definitions can conflict, the book treats the choice of definition as a governance decision with recorded trade-offs, and resists the claim that a model is simply fair. (Chapter 12)

**Federation.** An arrangement in which governance authority is shared under common standards: a central function sets standards and assures, while business units make many decisions locally within the framework. Distinct from centralisation and distribution. (Chapters 3, 20)

**Foundation model.** A broadly capable model, typically supplied by a third party and consumed as a service, on which applications are built. Preferred over the looser "AI model" when referring to such models, and governed as part of a supply chain the organisation does not control. (Chapter 19)

**Generative AI (GenAI).** AI that produces open ended output, such as text or images, rather than a bounded prediction. Its distinctive failure modes include fabrication, unsafe content and data leakage. Abbreviated GenAI after first use. (Chapter 19)

**Human oversight.** A human's capacity to intervene in or override an AI decision. Meaningful oversight requires authority, information, time and independence; oversight that lacks these is nominal. Forms range across a human in, on, or over the loop. (Chapter 15)

**Impact assessment.** The deeper examination, triggered by a higher risk tier, of a use case's affected individuals, fairness, safety, privacy, lawful basis and oversight needs. (Chapter 4)

**Incident response.** The defined, accountable process for acting when monitoring reveals a breach or an AI failure causes harm, including containment, handling of affected people, investigation and reporting. (Chapter 10)

**Lawful basis.** The legal ground on which personal data may be used for a specific AI purpose. Must be established for the AI use rather than assumed from the data's original collection. (Chapter 7)

**Lifecycle.** The continuous loop through which an AI system is governed, data, development, evaluation, deployment, monitoring and decommissioning, rather than a one time gate. (Part III)

**Lineage.** The traceable record of a dataset's path from source through every transformation into a model, captured during preparation. What makes deletion requests, audits and fairness investigations answerable. (Chapter 7)

**Lines of defence (three lines model).** The separation of those who own and run risk (first line), those who set policy and provide oversight and challenge (second line), and those who provide independent assurance (third line). (Chapters 5, 17)

**Model card / system card.** Documentation of what a model or deployed system is: its purpose, data, metrics, limitations and required oversight. Produced before approval, not after deployment. (Chapter 8)

**Model risk.** The risk that a model is inaccurate, biased, unstable or wrong in ways that are hard to detect, with consequences for those its decisions affect. Long governed in financial services; generalised by AI to many organisations. (Chapters 2, 8)

**Multi agent system.** An arrangement in which several autonomous agents interact or collaborate, introducing the possibility of emergent behaviour that no single component was designed to produce. (Chapter 19)

**Proportionality.** The principle that the strength of a control should match the risk it addresses, applied so that governance neither smothers low risk work nor leaves consequential risk uncontrolled. The unifying principle of the book. (Chapters 3, 21)

**Red teaming.** Adversarial testing of a system to find failures, unsafe outputs or security weaknesses that ordinary testing would miss. Warranted for higher risk systems, particularly for security. (Chapter 14)

**Responsible AI.** The set of outcomes an organisation seeks, fairness, transparency, safety, privacy, accountability, human oversight, contestability. Distinct from AI governance, which is the operating system that delivers and assures these outcomes. (Chapter 1, Part IV)

**Retrieval Augmented Generation (RAG).** A technique in which a model's output is grounded in retrieved data, introducing governance concerns around the provenance, access control and quality of the retrieved information. Abbreviated RAG after first use. (Chapters 7, 19)

**Risk appetite.** The amount and type of risk an organisation is willing to accept in pursuit of its objectives. Set by the board and made operational through risk tolerance. (Chapter 3)

**Risk tolerance.** The specific, often quantified, boundary within the risk appetite for a given class of use, such as an error rate, a bias threshold or a permitted degree of autonomy. (Chapter 3)

**Risk tier.** The category, from minimal through to unacceptable, to which classification assigns a use case, setting the strength of the controls it requires. (Chapter 4)

**Shadow AI.** AI use cases operating outside the governance system, never classified or controlled. A primary failure mode of classification and a signal that the governed path may be too onerous. (Chapters 4, 20)

**Three lines model.** See lines of defence.

**Validation.** The independent judgement, proportionate to risk, that a model's evaluation is sound and the model is fit for its intended use. Distinct from evaluation, which measures behaviour; validation judges sufficiency. (Chapter 8)

---

## A note on usage conventions

The book follows several lexical conventions that this glossary reflects:

- **Responsible AI** names outcomes; **AI governance** names the operating system that delivers them. They are not interchangeable.
- **Centralisation, federation and distribution** are three distinct arrangements, not loose synonyms.
- **Generative AI** is used on first reference and **GenAI** thereafter; **Retrieval Augmented Generation** is defined before **RAG** is used.
- **Foundation model** is preferred over "AI model" when referring to the broadly capable, usually third party models that applications are built on.
- Agents and models are described **mechanically**, by what they do, inference, generation, action selection, rather than in the language of human intention, understanding or desire.

These conventions are not stylistic preferences alone. Each preserves a distinction that carries a governance consequence, which is why the book maintains them throughout.
