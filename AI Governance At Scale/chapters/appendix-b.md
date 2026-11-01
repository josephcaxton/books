# Appendix B: Control Catalogue

This appendix gathers the governance controls introduced across the book into a single reference, organised by the part of the governance system they belong to. For each control it states the risk it addresses, the chapter that develops it, and a proportionality note, a reminder that the strength of the control should match the risk, since every control in this book is meant to be applied in proportion rather than uniformly.

The catalogue is a reference, not a mandate. No organisation needs every control at full strength; the right set, and the right depth, follow from the risk classification of each use case and the economics of Chapter 21. Treat this as a menu to draw from in proportion, not a checklist to satisfy in full. A control that reduces little risk for significant friction should be lightened or left out, however complete the catalogue might otherwise look.

---

## B.1 Foundations of control

| Control | Risk addressed | Chapter | Proportionality note |
| --- | --- | --- | --- |
| Mandatory intake and triage | Shadow AI, inconsistent judgement | 4 | Triage is light and universal; depth follows the tier |
| Risk tiering by impact and context | Governance out of proportion to risk | 4 | The tier sets the strength of every later control |
| Impact assessment | Consequential uses escaping scrutiny | 4 | Full assessment reserved for higher tiers |
| Named accountable owner | Diffuse, unassignable responsibility | 5 | Every material use case; lighter for low risk |
| Three lines of defence | Oversight without independence | 5 | Separation formalised by scale; roles even in small orgs |
| Tiered approval authority | Central bottleneck, unaccountable release | 5, 9 | Authority weight matched to tier |
| Right to halt | A harmful system no one can stop | 5, 9, 10 | Required wherever a system can cause harm |
| Layered policy, standards and controls | Intent that never becomes practice | 6 | Controls derived from assessed risk, not copied wholesale |
| Evidence designed into controls | Compliance that cannot be proved | 6, 17 | Near universal and cheap once built |

---

## B.2 Lifecycle controls

| Control | Risk addressed | Chapter | Proportionality note |
| --- | --- | --- | --- |
| Data provenance and inventory | Unknown or unlawful data in models | 7 | Every dataset feeding a model; depth by sensitivity |
| Lawful basis for the AI use | Training or grounding without a right to | 7 | Established for the AI purpose, not assumed |
| Representativeness evaluation | Inherited bias from unrepresentative data | 7, 12 | Strength set by how much the system affects people |
| Data to model lineage | Unanswerable deletion and audit | 7 | Captured during preparation, not reconstructed |
| Pre agreed evaluation criteria | Metrics chosen to flatter the model | 8 | Fixed before development for all tiers |
| Disaggregated evaluation | Group level harm hidden in an average | 8, 12 | Essential wherever groups are affected |
| Independent validation | Fitness judged by those who built it | 8 | Independence scaled to risk |
| Model and system cards | Models that cannot be relied on or challenged | 8 | Concise for low risk, full for high |
| Deployment risk acceptance | Going live with no accountable decision | 9 | Formal for high tiers, recorded sign off for low |
| Change control by materiality | Behaviour drifting through uncontrolled change | 9 | Material changes re-gated; routine ones not stalled |
| Version and rollback | A degrading change that cannot be reverted | 9 | Proportionate to consequence of the system |
| Fitness monitoring against baselines | Silent degradation that raises no error | 10 | Signals and tolerances set by tier |
| Drift detection | A model fit at release decaying in production | 10 | Depth scaled to risk and rate of change |
| Defined incident response | Harm met with improvisation | 10 | Rehearsed for high risk, simple for low |
| Controlled decommissioning | Orphaned models, lingering data, lost records | 11 | Deliberate for all; depth by risk and data sensitivity |

---

## B.3 Responsible AI controls

| Control | Risk addressed | Chapter | Proportionality note |
| --- | --- | --- | --- |
| Fairness definition and threshold | Fairness claimed but never defined | 12 | For decisions affecting people; depth by consequence |
| Bias remediation and re-measurement | Fixes that shift the problem elsewhere | 12 | Where a fairness threshold is breached |
| Redress route | Population fairness yet unjust individual outcomes | 12 | For consequential decisions about individuals |
| Disclosure of AI involvement | People unaware AI is deciding about them | 13 | Where AI affects a person; avoid notice fatigue |
| Meaningful explanation | Decisions that cannot be understood | 13 | Aimed at the recipient, in proportion to impact |
| Contestability and human review | Decisions that cannot be challenged | 13 | Reaches a human able to change the decision |
| Privacy controls across the data path | Personal data exposed by models | 14 | Strength by data sensitivity |
| Safety guardrails and bounded autonomy | Confident, plausible, harmful output | 14, 19 | Strength by potential for harm |
| AI specific security defences | Prompt injection, extraction, poisoning | 14 | Strength by exposure; grounded in likelihood, not alarm |
| Meaningful human oversight | Nominal oversight that cannot intervene | 15 | Form matched to consequence and volume |
| Automation bias countermeasures | Rubber stamping of a confident machine | 15 | Designed in and monitored via override rate |

---

## B.4 Regulation and assurance

| Control | Risk addressed | Chapter | Proportionality note |
| --- | --- | --- | --- |
| Regulatory horizon scanning | Being overtaken by moving regulation | 16 | Breadth by jurisdictions and exposure |
| Obligation to control translation | Knowing the rules yet not complying | 16 | Firmness matched to the obligation's status |
| Control to obligation to system mapping | Gaps invisible until a regulator finds them | 16 | Concentrated on binding obligations |
| Instrument status classification | Confusing advisory with binding | 16 | Prevents both gold plating and exposure |
| Three lines assurance | Controls that exist but do not operate | 17 | Depth and independence scaled to risk |
| Evidence capture and retention | Proof reconstructed too late to trust | 17 | Near universal; retention by obligation |
| Independent audit to the board | Captured, non independent assurance | 17 | Formality by scale; some independence always |
| External certification or conformity | Assurance lacking outside credibility | 17 | Where it adds value or is required |
| Sector obligation layering | General compliance missing sector duties | 18 | Scoped to genuinely regulated activities |
| Stricter standard resolution | Applying the weaker of two requirements | 18 | Applied where the sector exceeds the baseline |

---

## B.5 Scale, capability and economics

| Control | Risk addressed | Chapter | Proportionality note |
| --- | --- | --- | --- |
| Foundation model supply chain governance | Opaque, silently changing vendor models | 19 | For any externally supplied model capability |
| Agency bounding and blast radius limits | Autonomous action reaching too far | 19 | Strength by autonomy and action consequence |
| Generative output controls | Fabrication, unsafe content, leakage | 19 | Depth by stakes of the generative use |
| Multi agent interaction controls | Emergent behaviour between agents | 19 | Where several autonomous components interact |
| Fitted operating model | Bottleneck or inconsistency at scale | 20 | Distribution chosen per function and context |
| Sustainable maturity progression | Governance theatre from overreach | 20 | One sustainable step at a time |
| Risk based governance allocation | Effort spread without regard to risk | 21 | The organising principle of the whole catalogue |
| Marginal control review | Rigour that adds friction without reducing risk | 21 | Applied to every control, to keep the set proportionate |

---

## Using the catalogue

Three habits make the catalogue useful rather than burdensome.

First, **select by risk tier.** A low risk use case draws a light set from these controls; a high risk, people affecting system draws heavily. The classification of Chapter 4 is what tells you which, and the economics of Chapter 21 tell you how much.

Second, **apply the proportionality note.** Each control can be run at many strengths. The note is a reminder that the right strength is the one that matches the risk, and that a control run heavier than its risk warrants is friction the organisation will eventually route around.

Third, **map to obligations.** Many of these controls also satisfy regulatory requirements. Appendix C maps the obligations to the controls that meet them, so the same control can be read both as risk reduction and as compliance evidence. Read this catalogue and that map together, and a control's dual purpose, reducing risk and demonstrating compliance, becomes clear.
