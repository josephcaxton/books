# Appendix C: Regulatory Reference Map

This appendix maps the principal regulatory instruments discussed in the book to the controls and chapters that address them. Its purpose is practical: to let a reader move from an obligation to the mechanism that meets it, and from a control to the obligations it helps satisfy. It is the companion to Appendix B, which catalogues the controls themselves, and to Chapter 16, which describes the standing capability that keeps a mapping like this current.

Three cautions govern how this map should be read.

First, **it distinguishes status.** Instruments are marked as binding law, voluntary framework or certifiable standard, and provisions are described by whether they are in force, adopted but not yet fully effective, or proposed. These distinctions matter, and the book does not present anything draft or anticipated as if it were binding.

Second, **it is a snapshot of a moving landscape.** AI regulation is changing quickly, provisions phase in over time, and guidance continues to emerge. A map like this decays, which is exactly why Chapter 16 treats regulatory alignment as a continuous loop rather than a one time exercise. Treat the entries as orientation, not as a current legal position.

Third, and most importantly, **this is governance guidance, not legal advice.** The applicability and interpretation of every instrument below depend on an organisation's role, jurisdiction and specific circumstances, and require qualified local legal counsel. Nothing here should be relied upon as a statement of law.

---

## C.1 Cross cutting instruments

| Instrument | Status | What it broadly requires | Primary chapters |
| --- | --- | --- | --- |
| EU AI Act | Binding law, phasing in | Risk tiered obligations, heaviest on high risk systems: risk management, data governance, technical documentation, transparency, human oversight, accuracy, robustness, cybersecurity; duties by role; general purpose AI and generated content provisions | 4, 6, 7, 8, 10, 13, 14, 15, 16, 19 |
| NIST AI Risk Management Framework | Voluntary framework | A structured risk based approach through its Govern, Map, Measure and Manage functions; a common language and source of controls, not a legal mandate | 4, 5, 8, 9, 10, 16 |
| ISO/IEC 42001 | Certifiable standard | An AI management system: defined roles and responsibilities, risk based controls, documented information, performance evaluation, internal audit and continual improvement | 5, 6, 8, 10, 16, 17 |
| Data protection law (e.g. EU GDPR and equivalents) | Binding law, in force | Lawful basis, purpose limitation, data minimisation, security of processing, individual rights including erasure, and rules on solely automated decisions and profiling | 7, 11, 13, 14, 15 |

---

## C.2 Sector specific regimes

These regimes layer on top of the cross cutting instruments and are often binding and stricter. They are illustrative of the obligations, not a complete legal account, and apply only where an organisation operates in the relevant activity and jurisdiction.

| Sector | Illustrative instruments | What it broadly requires | Primary chapters |
| --- | --- | --- | --- |
| Financial services | Model risk management supervisory guidance (e.g. US Federal Reserve and OCC SR 11-7); conduct and prudential expectations (e.g. UK FCA, PRA); fair lending and consumer protection law | Independent model validation, ongoing monitoring and documentation proportionate to materiality; fair, non discriminatory credit and pricing outcomes; operational resilience; named senior accountability | 8, 17, 18 |
| Healthcare and life sciences | Medical device and software as a medical device regimes (e.g. US FDA guidance on AI/ML enabled devices, EU Medical Device Regulation); health data protection (e.g. HIPAA) | Clinical and analytical validity, risk management, conformity assessment, post market surveillance; heightened health data protection; clinical accountability retained by a professional | 8, 10, 14, 18 |
| Public sector | Administrative law; algorithmic transparency obligations; public records and retention duties | Lawful, reasoned, challengeable decisions; disclosure of where and how automated tools inform public decisions; retained records of decisions and their basis | 11, 13, 15, 18 |
| Employment and education | Anti discrimination and equality law; automated employment decision rules (e.g. NYC Local Law 144) | Non discriminatory automated decisions; bias audits of automated employment tools; notice to affected candidates; particular care where minors are involved | 12, 13, 18 |
| Critical infrastructure and safety critical sectors | Sector safety assurance regimes and sector regulators (energy, transport, utilities, industrial control) | Demonstrable safety, resilience and often certification before deployment where AI affects physical or operational safety | 14, 18 |

---

## C.3 Obligation themes mapped to controls

Cutting across the instruments, the same obligation themes recur. This table maps each recurring theme to the controls in Appendix B that most directly address it, so a reader can move from a common requirement to the mechanisms that satisfy it.

| Recurring obligation theme | Controls that address it | Chapters |
| --- | --- | --- |
| Risk management and classification | Mandatory intake and triage; risk tiering; impact assessment | 4 |
| Data governance and quality | Provenance and inventory; lawful basis; representativeness; lineage | 7 |
| Testing, accuracy and robustness | Pre agreed criteria; disaggregated evaluation; independent validation | 8 |
| Technical documentation | Model and system cards; deployment and change records; evidence capture | 8, 9, 17 |
| Transparency to affected people | Disclosure of AI involvement; meaningful explanation | 13 |
| Human oversight | Meaningful oversight; automation bias countermeasures; right to halt | 5, 9, 15 |
| Non discrimination and fairness | Fairness definition and threshold; representativeness; redress | 7, 12 |
| Privacy and data protection | Privacy controls across the data path; minimisation; retention and erasure at retirement | 7, 11, 14 |
| Security and resilience | AI specific security defences; safe failure; bounded autonomy | 14, 19 |
| Post market monitoring and incidents | Fitness monitoring; drift detection; incident response and reporting | 10 |
| Accountability and roles | Named owner; three lines of defence; tiered authority | 5 |
| Record keeping and retention | Evidence capture and retention; controlled decommissioning records | 11, 17 |
| Independent validation and audit | Independent validation; three lines assurance; external certification | 8, 17 |

---

## C.4 How to use this map

Use the map in two directions.

**From obligation to control.** When a regulator or an obligation raises a requirement, find the theme in C.3 or the instrument in C.1 and C.2, follow it to the controls, and confirm those controls are in place and producing evidence for the systems the obligation reaches. This is the path from a rule to a demonstrable response.

**From control to obligation.** When reviewing a control, read across to the obligations it helps satisfy, so a single control can be understood both as risk reduction and as compliance evidence. A disaggregated fairness evaluation, for example, serves fairness as a responsible AI outcome and simultaneously evidences an anti discrimination or bias audit obligation.

Two caveats bear repeating. The mapping is deliberately broad, because a precise mapping depends on an organisation's role, jurisdiction and circumstances, and because the instruments themselves are changing; Chapter 16's alignment loop is what turns this orientation into a current, organisation specific mapping. And, once more: this is governance guidance, not legal advice. The interpretation and applicability of any instrument require qualified local legal counsel, and this appendix is a starting point for that work rather than a substitute for it.
