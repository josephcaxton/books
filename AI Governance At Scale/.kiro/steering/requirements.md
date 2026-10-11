# Requirements: AI Governance At Scale

These requirements distil the enforceable rules from `book_overview.md`, `product.md` and
`steering.md` into checkable statements. They are written so that any chapter, section or
draft can be reviewed against them. Requirement levels follow the convention in
`book_overview.md`: **must**, **should**, **may** and **must not**.

---

## 1. Purpose and Scope
- **R1.1** The book must teach governance decision making for enterprise AI at scale, not how to govern one specific system.
- **R1.2** Every section must help the reader do at least one of the following: understand a governance problem, classify a risk, evaluate a control choice, understand a trade-off, align with an obligation, or apply a reusable mechanism. A section that does none of these should be removed.
- **R1.3** The book must remain governance focused. It must not become a general AI introduction, an ethics philosophy treatise, a regulation recital, a policy template pack, a tool or vendor guide, a data science methods book, an audit standards textbook, a compliance checklist book or an AI hype book.
- **R1.4** The book should select high value, reusable governance mechanisms. It must not attempt an exhaustive catalogue of every possible control; applicability and quality take priority over quantity.

## 2. Platform Neutrality
- **R2.1** Content must be platform neutral. It must not tie governance to a single cloud provider, model vendor or product.
- **R2.2** Any tool, platform or vendor mentioned must appear only as an example of a capability and must generalise to other environments.
- **R2.3** Examples must not assume a specific technology stack as a prerequisite for the governance mechanism to work.

## 3. Audience Fit
- **R3.1** Content must be pitched at experienced governance, risk, compliance, legal, architecture and senior technology leaders. It must not spend substantial space on beginner AI or basic corporate governance concepts.
- **R3.2** Foundational concepts may be explained only when they materially affect an AI governance decision.
- **R3.3** The book should serve the reader moving from established governance disciplines (IT governance, data governance, risk, audit, compliance) to AI specific governance (risk classification, model risk, lifecycle controls, human oversight, responsible AI, AI regulation).
- **R3.4** By the end, the reader should be able to Understand → Classify → Design → Assure → Operate → Monitor → Scale enterprise AI governance.

## 4. Thesis Consistency
- **R4.1** Content must reinforce the central thesis that enterprise AI governance is an operating model and systems problem, not a principles or policy document problem.
- **R4.2** The book must consistently prioritise the question "What governance system allows AI to deliver value safely, lawfully, fairly and accountably at scale?" over "What principles should we adopt?".
- **R4.3** Chapters must reflect the principle: govern the system around the risk, the accountability and the desired outcome, not just the statement.

## 5. Structure (Governance Control Blueprint)
- **R5.1** Each mechanism chapter should follow the blueprint sequence: Problem → Mechanism → Operating Model → Flow → Decisions → Trade-offs → Responsible AI → Regulation → Failure → Monitoring → Cost → Applicability → Verdict.
- **R5.2** Mechanism chapters must not begin with a framework or regulation description; they must begin with the governance problem or accountability gap.
- **R5.3** Every mechanism chapter must include an explicit trade-off analysis covering benefits, friction, cost, operational overhead, risk reduction, speed to deliver and unintended consequences.
- **R5.4** Every mechanism chapter must include a "When NOT to use this mechanism" section.
- **R5.5** Every mechanism chapter must end with a "Governance Verdict": a short, decisive, context aware recommendation.
- **R5.6** Mechanism chapters should present at least one operating model and describe the decision and control flow step by step.
- **R5.7** Chapters should use the recurring visual markers consistently: 🧩 Mechanism, ⚖️ Trade-off, 🔐 Safety & Security, 🧭 Accountability, 💷 Cost & Friction, ⚠️ Failure Mode, 🏛️ Governance Decision, 👁️ Monitoring, 📜 Regulatory Alignment, 📐 Governance Verdict.
- **R5.8** Diagrams must be authored as diagram as code (Mermaid) inline in the chapter Markdown, which is the version controlled source of truth. Print ready SVG or PNG assets are produced from that source by a render step at typeset time and stored under `AI Governance At Scale/images/`; hand drawn images must not be maintained as a parallel source. The decision and control flow (blueprint section 4) should be expressed as a Mermaid sequence or flow diagram, and the operating model (blueprint section 3) as a Mermaid flowchart. The diagram must not replace the step by step written flow required by R5.6; it accompanies it.

## 6. Governance Rigour
- **R6.1** No governance mechanism may be presented without discussing benefits, limitations, friction and appropriate use cases.
- **R6.2** Every significant recommendation must acknowledge relevant trade-offs. The book must not use "always", "never" or "this is the best model" unless supported by a clearly defined constraint.
- **R6.3** The book must treat governance as contextual and must explicitly recognise that a mechanism suitable for one organisation may be unsuitable for another based on sector, regulation, risk appetite, data sensitivity, operating model, scale or maturity.
- **R6.4** Governance mechanisms must not be presented without discussing their failure modes, including circumvention and shadow AI.
- **R6.5** When introducing a decision, the book should distinguish must, should, may and must not.
- **R6.6** Controls must be proportionate: the book must relate the strength of a control to the level of risk and must flag where a control adds friction without reducing risk.

## 7. Responsible AI, Risk and Safety
- **R7.1** Responsible AI outcomes (fairness, transparency, explainability, privacy, safety, accountability, human oversight, contestability) must be addressed as governance controls, following Principle → Risk → Control → Evidence, not as abstract ethics.
- **R7.2** Risks (bias, data leakage, unsafe output, loss of human oversight, excessive autonomy, misuse) must be explained in terms of likelihood, impact, affected parties and controls, not through sensational or fear based framing.
- **R7.3** The book must treat the AI lifecycle (data, development, evaluation, deployment, monitoring, decommissioning) as a continuous governed loop rather than a one time gate.
- **R7.4** Human oversight requirements must be described concretely (who, when, with what authority and information) rather than asserted as a slogan.

## 8. Regulation and Assurance
- **R8.1** Regulatory instruments must be translated into risks, controls and evidence rather than recited clause by clause. Primary reference points are the cross cutting instruments (EU AI Act, NIST AI RMF, ISO/IEC 42001) together with the sector specific regimes in R8.6.
- **R8.6** Sector specific regulation must be treated as a first class reference point, not an afterthought, because AI governance obligations differ materially by sector. The book must address, as primary sector references:
  - **Financial services:** model risk management expectations (for example the US Federal Reserve and OCC SR 11-7 guidance), consumer and fair lending obligations, and conduct and prudential expectations from regulators such as the UK FCA and PRA.
  - **Healthcare and life sciences:** medical device and software as a medical device regulation (for example US FDA guidance on AI/ML enabled devices and the EU Medical Device Regulation), clinical safety, and health data protection (for example HIPAA).
  - **Public sector:** algorithmic transparency, procurement and administrative accountability obligations, and public records duties.
  - **Employment and education:** anti discrimination obligations and automated decision rules affecting individuals (for example New York City Local Law 144 on automated employment decision tools).
  - **Critical infrastructure and safety critical sectors:** safety assurance regimes and sector regulators where AI affects physical or operational safety.
  Cross cutting data protection regimes (for example the EU GDPR and equivalents), including rules on automated decision making and profiling, must be applied across all sectors.
- **R8.7** The book must make clear that sector obligations layer on top of, and may be stricter than, cross cutting AI regulation, and must help the reader reason about overlapping and sometimes conflicting obligations.
- **R8.2** The book must distinguish regulatory status clearly: in force → adopted → proposed → anticipated. It must not present draft or anticipated regulation as if in force.
- **R8.3** The book must not treat one jurisdiction's approach as categorically superior; regulatory comparisons must be factual, practical and relevant to the decision.
- **R8.4** Assurance discussions must specify the evidence an auditor or regulator would expect and must use the three lines model and attestation concepts consistently.
- **R8.5** The book must state that it provides governance guidance, not legal advice, and that regulation requires local legal interpretation.

## 9. Accuracy and Integrity
- **R9.1** The book must not invent organisations, incidents, statistics, audit findings, benchmarks or case studies.
- **R9.2** Compliance rates, cost figures, incident reductions, risk percentages and similar numbers must not be fabricated. Where numbers are used, their source, assumptions and context must be identified.
- **R9.3** Hypothetical scenarios and examples must be clearly identified as hypothetical.
- **R9.4** The book must not present emerging governance practice as a settled standard, and must distinguish established practice from emerging practice.
- **R9.5** The book must not imply personal implementation experience unless it is explicitly established.

## 10. Tone and Voice
- **R10.1** The voice must be authoritative, practical, analytical, challenging, clear, conversational, evidence driven and future oriented, reading like an experienced governance lead in a steering committee.
- **R10.2** The book must not read like vendor or consultancy marketing material and must not promote a framework or tool merely for being well known.
- **R10.3** The book must not use AI hype or claims such as AI replacing people, AGI timelines, guaranteed outcomes or inevitable disruption.
- **R10.4** The book must not anthropomorphise models (for example "the AI understands" or "the model wants"); it should describe the actual mechanism such as inference, generation, classification, retrieval or autonomous action.
- **R10.5** The book must not engage in ethics-washing: responsible AI claims must be backed by described controls and evidence.
- **R10.6** Chapter conclusions must provide governance lessons or decisions and must not restate generic "governance matters" sentiments.
- **R10.7** Rhetorical questions may introduce a problem but must not be overused as a device.

## 11. Language and Style
- **R11.1** The book must use British English spelling throughout (for example governance, organisation, prioritise, authorisation, modelling, centralised).
- **R11.2** Hyphenation must be minimised. Terms should be written as open compounds (for example "decision making", "risk based", "real world") unless omitting the hyphen is grammatically incorrect or changes meaning. Structural prefixes such as "AI-native", "non-technical" and "co-author" remain hyphenated.
- **R11.3** Acronyms must be expanded at first use. "Generative AI" must be used on first reference and "GenAI" thereafter. "EU AI Act", "NIST AI Risk Management Framework (NIST AI RMF)" and "ISO/IEC 42001" must be expanded before abbreviation.
- **R11.4** "Responsible AI" must refer to the set of outcomes; "AI governance" must refer to the operating system that delivers and assures them. The two must not be used interchangeably.
- **R11.5** Centralisation, federation and distribution must not be used interchangeably.
- **R11.6** Governance and systems language must be preferred over principle and marketing language. Preferred descriptors include proportionate, risk based, evidence based, accountable, auditable, enforceable and operable, in place of promotional terms such as world class, best in class, next generation or cutting edge.
- **R11.7** Banned buzzwords must be avoided, including paradigm shift, digital transformation, trustworthy AI used as a slogan, ethical by design used as a slogan, next generation, cutting edge and unlock the full potential.
- **R11.8** Vocabulary must be clear rather than legalistic or academic; complex ideas should be explained simply without becoming simplistic. Governance must not be described with subjective praise such as "beautiful" or "elegant" and must be evaluated by measurable characteristics such as proportionality, enforceability, auditability, operability, cost, friction and risk reduction.

## 12. Examples and Practical Aids
- **R12.1** Examples should reflect realistic organisational scenarios (regulated industry use cases, high risk decisioning, generative AI deployment, vendor models, shadow AI) rather than trivial cases.
- **R12.2** Policy templates, checklists and decision tables may be included as practical aids but must not replace governance understanding and decision making.
- **R12.3** Any example control must generalise across technology environments in keeping with the platform neutrality requirement (Section 2).

## 13. Physical and Production Constraints
- **R13.1** The manuscript should target 55,000 to 85,000 words (approximately 200 to 240 printed pages at 6" x 9").
- **R13.2** Chapter scope should be sized so the overall word count stays within the target range while allowing mechanism chapters enough room for the full blueprint.

---

## Open Questions
- Should `requirements.md` also capture per chapter acceptance criteria, or remain a book wide rule set? (Currently book wide.)
- ~~Which regulatory instruments should be treated as primary reference points versus secondary?~~ Resolved: cross cutting instruments (EU AI Act, NIST AI RMF, ISO/IEC 42001) plus the sector specific regimes in R8.6 (financial services, healthcare, public sector, employment and education, critical infrastructure) are all primary, with cross cutting data protection applied throughout. See R8.6 and R8.7.
- Is there a defined citation or references style for R9.2 and any regulatory sources?
