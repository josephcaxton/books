# Requirements: The AWS GenAI Architect

These requirements distil the enforceable rules from `book_overview.md`, `product.md` and
`steering.md` into checkable statements. They are written so that any chapter, section or
draft can be reviewed against them. Requirement levels follow the convention in
`book_overview.md`: **must**, **should**, **may** and **must not**.

---

## 1. Purpose and Scope

- **R1.1** The book must teach architectural decision making for enterprise GenAI on AWS, not how to build one specific application.
- **R1.2** Every section must help the reader do at least one of the following: understand an architectural problem, evaluate a design choice, understand a trade-off, mitigate a risk, or apply a reusable pattern. A section that does none of these should be removed.
- **R1.3** The book must remain AWS architecture focused. It must not become a general AI introduction, a prompt engineering book, an AWS service catalogue, a programming tutorial, a model training manual, a product comparison book, a security textbook, an AI ethics treatise, a certification guide or an AI hype book.
- **R1.4** The book should select high value, reusable enterprise patterns. It must not attempt an exhaustive catalogue of every possible GenAI pattern; applicability and quality take priority over quantity.

## 2. Audience Fit

- **R2.1** Content must be pitched at experienced architects, technical design authorities, platform engineers and senior technology leaders. It must not spend substantial space on beginner AWS, cloud or programming concepts.
- **R2.2** Foundational concepts may be explained only when they materially affect a GenAI architectural decision.
- **R2.3** The book should serve the "cloud to AI" reader by bridging established cloud architecture (VPC, IAM, ECS, Lambda, API Gateway, networking, security) to GenAI architecture (Bedrock, RAG, AI Gateway, agents, AgentCore, AI governance, GenAIOps).
- **R2.4** By the end, the reader should be able to Understand → Design → Evaluate → Secure → Govern → Operate → Optimise enterprise GenAI architectures on AWS.

## 3. Thesis Consistency

- **R3.1** Content must reinforce the central thesis that enterprise GenAI is an architecture and systems engineering problem, not a model or prompt problem.
- **R3.2** The book must consistently prioritise the question "What architecture allows AI to deliver value safely, reliably, governably and economically at enterprise scale?" over "Which model should we use?".
- **R3.3** Chapters must reflect the principle: design the system around the business problem, enterprise constraints and desired outcome, not around the model.

## 4. Structure (Architecture Pattern Blueprint)

- **R4.1** Each architecture pattern chapter should follow the blueprint sequence: Problem → Pattern → Architecture → Flow → Decisions → Trade-offs → Security → Network → Failure → Operations → Cost → Applicability → Verdict.
- **R4.2** Pattern chapters must not begin with an AWS service description; they must begin with the architectural problem.
- **R4.3** Every pattern chapter must include an explicit trade-off analysis covering benefits, costs, complexity, operational overhead, security, performance and cost implications.
- **R4.4** Every pattern chapter must include a "When NOT to use this pattern" section.
- **R4.5** Every pattern chapter must end with an "Architect's Verdict": a short, decisive, context aware recommendation.
- **R4.6** Pattern chapters should present at least one reference architecture and describe the request and data flow step by step.
- **R4.7** Pattern chapters should use the recurring visual markers consistently: 🧩 Pattern, ⚖️ Trade-off, 🔐 Security, 🌐 Network, 💷 Cost, ⚠️ Failure Mode, 🏗️ Architecture Decision, 👁️ Observability, 🤖 Agentic Consideration, 📐 Architect's Verdict.
- **R4.8** Diagrams must be authored as diagram as code (Mermaid) inline in the chapter Markdown, which is the version controlled source of truth. Print ready SVG or PNG assets are produced from that source by a render step at typeset time and stored under `The AWS GenAI Architect/images/`; hand drawn images must not be maintained as a parallel source. Request and data flow (blueprint section 4) should be expressed as a Mermaid sequence diagram, and structural reference architectures (blueprint section 3) as a Mermaid flowchart. The diagram must not replace the step by step written flow required by R4.6; it accompanies it.

## 5. Architectural Rigour

- **R5.1** No architecture pattern may be presented without discussing benefits, limitations, risks and appropriate use cases.
- **R5.2** Every significant recommendation must acknowledge relevant trade-offs. The book must not use "always use", "never use" or "this is the best architecture" unless supported by a clearly defined constraint.
- **R5.3** The book must treat architecture as contextual and must explicitly recognise that a pattern suitable for one organisation may be unsuitable for another based on security, regulation, data residency, operating model, scale, latency, cost or maturity.
- **R5.4** Successful architectures must not be presented without discussing their failure modes.
- **R5.5** When introducing a decision, the book should distinguish must, should, may and must not.

## 6. Security, Governance and Responsible AI

- **R6.1** Security must be integrated into architecture discussions rather than treated as an afterthought.
- **R6.2** Security threats (prompt injection, data leakage, excessive agency, tool abuse) must be explained in terms of attack surface, likelihood, impact and architectural controls, not through sensational or fear based framing.
- **R6.3** Responsible AI must be addressed as it affects architecture and governance, following Principle → Risk → Architectural Control → Operational Control. Extended philosophical ethics discussion that does not translate into architectural decisions must be avoided.
- **R6.4** Multi account architecture terms must be used consistently: application account, AI account, platform account, security account and logging account.

## 7. Accuracy and Integrity

- **R7.1** The book must not invent customer examples, production statistics, benchmarks, AWS capabilities, case studies or industry data.
- **R7.2** Performance figures, cost savings, latency improvements, accuracy percentages and ROI claims must not be fabricated. Where numbers are used, their source, assumptions and context must be identified.
- **R7.3** Hypothetical architectures and examples must be clearly identified as hypothetical.
- **R7.4** The book must not present unannounced AWS features or speculative roadmaps as fact, and must distinguish Established → Emerging → Experimental → Speculative.
- **R7.5** The book must not imply personal implementation experience unless it is explicitly established.

## 8. Tone and Voice

- **R8.1** The voice must be authoritative, practical, analytical, challenging, clear, conversational, evidence driven and future oriented, reading like an experienced technical design authority in an architecture review.
- **R8.2** The book must not read like AWS marketing material and must not promote AWS services merely for being AWS services or imply an AWS native solution is automatically correct.
- **R8.3** The book must not use AI hype or claims such as AI replacing humans, AGI timelines, guaranteed ROI or inevitable disruption.
- **R8.4** The book must not anthropomorphise models (for example "the AI understands" or "the model thinks"); it should describe the actual mechanism such as inference, retrieval, tool invocation or probabilistic generation.
- **R8.5** The book must not attack competing cloud providers or AI platforms; comparisons must be factual, architectural and relevant to the decision at hand.
- **R8.6** Chapter conclusions must provide architectural lessons or decisions and must not restate generic "the future is AI" sentiments.
- **R8.7** Rhetorical questions may introduce a problem but must not be overused as a device.

## 9. Language and Style

- **R9.1** The book must use British English spelling throughout (for example architecture, optimisation, centralised, authorisation, organisation, modelling).
- **R9.2** Hyphenation must be minimised. Terms should be written as open compounds (for example "decision making", "real world", "risk management") unless omitting the hyphen is grammatically incorrect or changes meaning. Structural prefixes such as "AI-native", "non-technical" and "co-author" remain hyphenated.
- **R9.3** Acronyms must be expanded at first use. "Generative AI" must be used on first reference and "GenAI" thereafter. "Retrieval Augmented Generation" must be defined before "RAG" is used.
- **R9.4** "Amazon Bedrock" and "Amazon Bedrock AgentCore" must be used on first reference in a major section, then "Bedrock" and "AgentCore" thereafter. "Foundation model" must be preferred over "AI model" when referring to Bedrock accessible models.
- **R9.5** Centralisation, federation and distribution must not be used interchangeably. "AI Gateway" refers to the architectural capability; "Core GenAI" refers to the book's specific platform reference implementation. "Agent", "agentic workflow" and "multi agent system" must be used with their distinct meanings.
- **R9.6** Architecture language must be preferred over product marketing language. Preferred descriptors include production grade, enterprise scale, secure by design, policy driven, least privilege, observable, resilient and cost aware, in place of promotional terms such as revolutionary, game changing, next generation or cutting edge.
- **R9.7** Banned buzzwords must be avoided, including paradigm shift, digital transformation, hyper scale, next generation, cutting edge, disruptive innovation, AI-powered everything, unlock the full potential and unprecedented opportunity.
- **R9.8** Vocabulary must be clear rather than academic; complex ideas should be explained simply without becoming simplistic. Architectures must not be described with subjective praise such as "beautiful", "elegant" or "brilliant" unless genuinely relevant, and must be evaluated by measurable characteristics such as simplicity, resilience, security, maintainability, scalability, latency, cost and operational complexity.

## 10. Code and Examples

- **R10.1** Code must support architectural understanding and must not replace it. Large implementation blocks must not appear where a concise example or architecture explanation suffices.
- **R10.2** Examples should reflect enterprise relevant scenarios (enterprise knowledge, customer service, financial processes, internal operations, developer platforms, document intelligence, business workflows, agents accessing enterprise systems) rather than trivial hello world cases.
- **R10.3** The book must not read as a step by step implementation cookbook; architectural understanding and decision making remain the primary objective.

## 11. Physical and Production Constraints

- **R11.1** The manuscript should target 55,000 to 85,000 words (approximately 200 to 240 printed pages at 6" x 9").
- **R11.2** Chapter scope should be sized so the overall word count stays within the target range while allowing pattern chapters enough room for the full blueprint.

---

## Open Questions

- Should `requirements.md` also capture per chapter acceptance criteria, or remain a book wide rule set? (Currently book wide.)
- ~~Are diagrams to be authored inline or supplied as external assets?~~ Resolved: hybrid approach adopted. Diagrams are authored as Mermaid inline (source of truth) and rendered to `The AWS GenAI Architect/images/` at typeset time. See R4.8.
- Is there a defined citation or references style for R7.2 and Appendix G?
