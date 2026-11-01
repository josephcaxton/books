# Appendix A: Governance Decision Checklists

Each mechanism chapter closed with a decision checklist. This appendix gathers them in one place for quick reference, and opens with a general checklist distilled from them all. The checklists are not bureaucracy; they are a way of ensuring the important questions are asked every time rather than only when someone remembers, and of making governance decisions repeatable rather than dependent on who happens to be in the room.

Use the general checklist for any AI use case, and the mechanism specific checklists when applying a particular control. A checklist is a prompt for judgement, not a substitute for it: a ticked box on a disproportionate control is still a disproportionate control.

---

## The General Governance Checklist

For any AI use case, before relying on it:

- [ ] Is the actual risk clearly stated, including who it affects and how, before any control is chosen?
- [ ] Has the use case been classified, with the classification recorded and its rationale defensible?
- [ ] Is there a single named owner accountable for the use case and its outcomes?
- [ ] Are the controls applied proportionate to the assessed risk, neither smothering nor leaving it uncontrolled?
- [ ] Does each control produce evidence as it operates, rather than requiring reconstruction later?
- [ ] Have the applicable cross cutting and sector specific obligations been identified and translated into controls?
- [ ] Is there meaningful human oversight where the decision affects people?
- [ ] Is the use case monitored in production, with a defined response when something goes wrong?
- [ ] Has someone independent confirmed the controls actually operate?
- [ ] Is the decision, and the trade-offs accepted, recorded so it can be revisited as context changes?

---

## Chapter 4 — Risk Classification and Impact Assessment

- [ ] Does every AI use case enter through a single, mandatory front door?
- [ ] Is the tiering based on impact and context rather than technology type?
- [ ] Are the triage questions consistent, objective and hard to game?
- [ ] Does a higher tier trigger a proportionate impact assessment that is actually completed?
- [ ] Is approval authority matched to tier rather than concentrated in one body?
- [ ] Are classifications reclassified on change, incident or elapsed time?
- [ ] Is every classification, assessment and decision recorded with its rationale?
- [ ] Does the mechanism map tiers to the applicable cross cutting and sector obligations?
- [ ] Is classification quality itself assured by an independent line?

---

## Chapter 5 — Accountability and the Governance Operating Model

- [ ] Does every material AI use case have a single named accountable owner with real standing?
- [ ] Are the first, second and third lines genuinely separated in practice, not just on paper?
- [ ] Are decision rights, who approves, who halts, explicit and matched to risk tier?
- [ ] Does approval authority scale by tier rather than concentrating in one body?
- [ ] Does independent assurance report to the board rather than to the function it reviews?
- [ ] Can a system breaching its tolerances be halted by someone other than its builder?
- [ ] Is the second line positioned to enable safe delivery, not only to refuse?
- [ ] Are committees, terms of reference and reporting lines maintained rather than merely declared?
- [ ] Does the model align with any applicable personal accountability regime?

---

## Chapter 6 — Policy, Standards and Control Design

- [ ] Is there a short, stable policy expressing mandatory requirements and approved by the board?
- [ ] Does every risk tier have standards that translate policy into that context?
- [ ] Is every standard decomposed into specific, checkable controls?
- [ ] Is every control mapped to the risk it reduces and, where relevant, the obligation it meets?
- [ ] Does each control specify the evidence it produces?
- [ ] Are controls proportionate to tier rather than uniform across the estate?
- [ ] Does assurance test whether controls operate, not merely whether they exist?
- [ ] Are standards versioned and revised as regulation and practice change?
- [ ] Can the organisation explain why each control exists, or should some be retired?

---

## Chapter 7 — Data Governance for AI

- [ ] Does every dataset feeding a model have recorded provenance and a known owner?
- [ ] Is a lawful basis established for the specific AI use, not assumed from original collection?
- [ ] Is data classified for sensitivity, setting access, handling and residency?
- [ ] Is fitness evaluated for representativeness, not only technical accuracy?
- [ ] Is lineage captured during preparation rather than reconstructed later?
- [ ] Is the link between datasets and the models they trained recorded in the register?
- [ ] Can the organisation honour a deletion request that reaches data used in a model?
- [ ] Does a change to a source or its basis trigger reassessment of dependent models?
- [ ] Is the depth of data governance proportionate to data sensitivity and model risk?

---

## Chapter 8 — Development, Evaluation and Validation Controls

- [ ] Were the evaluation criteria fixed before development rather than chosen to fit the results?
- [ ] Is the model evaluated on data representative of production, including hard cases and under represented groups?
- [ ] Are results disaggregated so performance for each relevant group is visible?
- [ ] Does evaluation cover fairness, robustness and failure behaviour, not only aggregate accuracy?
- [ ] Is validation independent of the development team, in proportion to risk?
- [ ] Does a model that fails validation return for improvement rather than proceed?
- [ ] Are model and system cards completed before approval, not after deployment?
- [ ] Do retraining and material change trigger re-evaluation and, where warranted, revalidation?
- [ ] Is the depth of evaluation and validation proportionate to the risk tier?

---

## Chapter 9 — Deployment Approval and Change Control

- [ ] Does every production model have a formal risk acceptance by an authority matched to its tier?
- [ ] Does a readiness check confirm evidence, documentation and controls before approval?
- [ ] Is the approval recorded with its evidence, conditions and rationale?
- [ ] Are responsible AI conditions carried into operation through the approval?
- [ ] Is every change classified by materiality, with material changes re-entering the gate?
- [ ] Are materiality classifications assured against gaming?
- [ ] Are silent vendor model updates detected and treated as changes?
- [ ] Can the organisation identify the exact version live in production?
- [ ] Is there a tested rollback path for a change that degrades behaviour?
- [ ] Is the gate proportionate enough that teams pass through it rather than around it?

---

## Chapter 10 — Monitoring, Drift and Incident Response

- [ ] Does monitoring cover fitness signals, quality, fairness and drift, not only infrastructure health?
- [ ] Are the evaluation baselines carried into production as the monitoring reference?
- [ ] Are tolerances set in proportion to the use case's risk tier?
- [ ] Do breaches alert an accountable owner empowered to act, not a dashboard?
- [ ] Is fairness monitored disaggregated by group over time, not only at release?
- [ ] Is there a defined AI incident response covering severity, containment and halting?
- [ ] Does incident handling include identifying and remediating affected individuals?
- [ ] Are reportable incidents reported within the required timelines?
- [ ] Do incident findings feed back to classification, the gate and evaluation?
- [ ] Is alerting tuned to avoid fatigue, and are baselines reset on revalidation?

---

## Chapter 11 — Decommissioning and Model Retirement

- [ ] Is retirement initiated by a deliberate trigger rather than allowed to drift?
- [ ] Are all dependent systems, processes and affected decisions identified before withdrawal?
- [ ] Is there a transition plan for dependents, or a confirmation the capability is no longer needed?
- [ ] Is the model fully withdrawn, with endpoints disabled and access revoked, not merely deprecated?
- [ ] Are training data, the model artefact and derived data retained or deleted per obligation?
- [ ] Are residency and legal hold checked before any deletion?
- [ ] Are outstanding erasure requests reaching the model honoured by its retirement?
- [ ] Are the records that must outlive the model preserved per the retention schedule?
- [ ] Is the model marked retired in the register, not silently absent?
- [ ] Is the depth of the retirement process proportionate to the model's risk and data sensitivity?

---

## Chapter 12 — Fairness, Bias and Non-discrimination Controls

- [ ] Does each people affecting decision have a fairness definition chosen and recorded by governance?
- [ ] Are the trade-offs against other fairness definitions acknowledged rather than hidden?
- [ ] Are the relevant protected or affected groups identified, informed by law and context?
- [ ] Is representativeness addressed at the data as a primary bias control?
- [ ] Is fairness measured disaggregated across groups, not in aggregate?
- [ ] Does the fairness threshold gate deployment in proportion to risk?
- [ ] Is a remediated model re-measured to check the fix did not shift the problem?
- [ ] Is fairness monitored disaggregated in production against the baseline?
- [ ] Is there a redress route for individuals to challenge and correct an outcome?
- [ ] Is the depth of the control proportionate to how much the decision affects people?

---

## Chapter 13 — Transparency, Explainability and Contestability

- [ ] Are disclosure, explanation and contestability treated as distinct controls, not one notice?
- [ ] Is the person told, clearly and at the right moment, that AI is involved?
- [ ] Is the kind of explanation a decision requires designed in advance and aimed at the recipient?
- [ ] Are explanations faithful to the model's actual basis rather than plausible fabrications?
- [ ] Is there a usable route to contest an outcome?
- [ ] Does a challenge reach a human with the authority and information to change the decision?
- [ ] Are explanations bounded so they do not expose others' data or exploitable internals?
- [ ] Do patterns in challenges feed back into fairness and model review?
- [ ] Is the overturn rate monitored as a signal of decisions going wrong?
- [ ] Are the controls applied in proportion to how much the system affects the person?

---

## Chapter 14 — Privacy, Safety and Security Controls

- [ ] Are privacy, safety and security treated as three distinct families with distinct owners?
- [ ] Is personal data controlled across training, inference and output, not only at rest?
- [ ] Is unsafe behaviour defined for the system, with guardrails against it?
- [ ] Is autonomous authority bounded to contain the consequence of a wrong action?
- [ ] Does the system fail to a safe state?
- [ ] Are AI specific security threats defended against, alongside ordinary cyber controls?
- [ ] Is each family tested, with red teaming where the risk warrants it?
- [ ] Is each family monitored for its own signals and connected to incident response?
- [ ] Are controls grounded in likelihood and impact rather than alarm?
- [ ] Is the strength of each family proportionate to that system's actual exposure?

---

## Chapter 15 — Human Oversight and Meaningful Control

- [ ] Is the form of oversight, in, on or over the loop, matched to the decision's consequence and volume?
- [ ] Does the overseeing human have genuine authority to change, reject or halt the output?
- [ ] Is the human given a meaningful explanation and the model's confidence and limits?
- [ ] Is there enough time and capacity for genuine review rather than rubber stamping?
- [ ] Are overseers supported and protected for disagreeing, not measured only on throughput?
- [ ] Is automation bias designed against and monitored?
- [ ] Can the human escalate concerns and halt the system where warranted?
- [ ] Is the override rate monitored and investigated when it looks implausibly low?
- [ ] Where meaningful oversight is infeasible, has autonomy at that consequence been reconsidered?
- [ ] Is oversight resourced enough to be real, and proportionate enough to be affordable?

---

## Chapter 16 — Cross Cutting Regulation

- [ ] Is regulatory alignment a standing capability rather than a one time summary?
- [ ] Is horizon scanning tracking relevant instruments and their status, in force to anticipated?
- [ ] Has an applicability assessment identified which obligations apply, given role and jurisdiction?
- [ ] Are instruments classified as binding law, voluntary framework or certifiable standard?
- [ ] Are obligations translated into controls through the existing standards layer, not a parallel regime?
- [ ] Is each control mapped to its obligation and each obligation to the systems it reaches?
- [ ] Does each control produce the evidence the regulation expects?
- [ ] Is going beyond binding requirements a deliberate choice rather than accidental gold plating?
- [ ] Is the firmness of controls matched to the firmness of the obligation, in force versus proposed?
- [ ] Is the mapping refreshed as provisions phase in and guidance emerges?

---

## Chapter 17 — Assurance, Audit and Evidence

- [ ] Is assurance layered across the three lines, with increasing independence?
- [ ] Does independent audit report to the board rather than to the functions it examines?
- [ ] Does assurance test whether controls operate, not merely whether they are documented?
- [ ] Is evidence captured as controls run, rather than reconstructed for audits?
- [ ] Is assurance depth scaled to the risk of the control and the system?
- [ ] Is external certification or conformity used where it adds independent credibility?
- [ ] Are findings classified, tracked to closure and fed back to the controls?
- [ ] Is a suspiciously clean findings log investigated as a sign of weak independence?
- [ ] Can the organisation produce, on request, the evidence that any given control operated?
- [ ] Is the effectiveness of the assurance function itself reviewed?

---

## Chapter 18 — Sector Specific Governance

- [ ] Is each use case classified for whether it falls within a regulated activity, and which sector regime applies?
- [ ] Do the cross cutting baseline controls remain in place beneath the sector layer?
- [ ] Are the sector specific obligations identified and translated into controls and evidence?
- [ ] Is the stricter standard applied wherever the sector regime exceeds the baseline?
- [ ] Is cross cutting data protection applied together with the sector regime, not displaced by it?
- [ ] Are overlaps and conflicts between regimes reasoned through and recorded?
- [ ] For shared systems, is the most restrictive applicable regime applied across jurisdictions?
- [ ] Is sector specialist expertise brought to bear on regulated activities?
- [ ] Is the sector specific evidence the regulator expects captured alongside the general record?
- [ ] Is the sector layer scoped to genuinely regulated activities rather than applied uniformly?

---

## Chapter 19 — Governance for Generative and Agentic AI

- [ ] Is each system classified for whether it is generative, agentic, or both, and for its degree of autonomy?
- [ ] Is the underlying foundation model governed as a supply chain, including version and vendor change?
- [ ] Do generative controls address fabrication, unsafe content and data leakage, not just a single metric?
- [ ] Is AI generated content marked or disclosed where it could be taken as human or authoritative?
- [ ] Are an agent's permitted tools and actions defined explicitly, with everything else denied by default?
- [ ] Is each action's authority limited so a wrong action cannot cause disproportionate harm?
- [ ] Do high consequence or irreversible actions require a human checkpoint before execution?
- [ ] Can a running agent be interrupted or halted by a human?
- [ ] Are interactions between multiple agents bounded and monitored for emergent behaviour?
- [ ] Is the strengthening proportionate to capability and consequence rather than to general unease?

---

## Chapter 20 — Operating Models for Scale and Governance Maturity

- [ ] Is the distribution of authority chosen per governance function rather than applied uniformly?
- [ ] At scale, are standards and assurance centralised while execution is federated?
- [ ] Is approval authority matched to risk tier so no single body approves everything?
- [ ] Is the function's maturity assessed honestly rather than assumed?
- [ ] Is the maturity target one sustainable step beyond the current state?
- [ ] Is capability built before the organisation relies on the control it supports?
- [ ] Is a smaller set of controls operated genuinely preferred to a full set operated nominally?
- [ ] Is federation backed by clear standards and real assurance, not distribution in disguise?
- [ ] Is avoidance read as a signal to fix the operating model, not only to enforce harder?
- [ ] Are the model and maturity target revisited as the estate and organisation change?

---

## Chapter 21 — The Economics and Proportionality of Governance

- [ ] Is governance treated as an investment to be sized, not a cost to minimise or a virtue to maximise?
- [ ] Is effort allocated across the estate in proportion to risk?
- [ ] Is each control weighed by the risk it reduces against the friction it adds?
- [ ] Are controls that reduce little risk for much friction lightened or removed?
- [ ] Is friction, including delay and avoidance, counted as a real cost?
- [ ] Is the cost of failure accounted for honestly, especially for people protecting controls?
- [ ] Is governance framed and communicated as an enabler of safe adoption?
- [ ] Is the value governance delivers measured alongside its cost?
- [ ] Is avoidance read as a signal that a control may be disproportionate?
- [ ] Is the allocation rebalanced as the estate, risk profile and regulation change?
