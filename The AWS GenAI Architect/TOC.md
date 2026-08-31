# The AWS GenAI Architect

### Enterprise Architecture Patterns for Building Secure, Scalable and Intelligent AI Systems with Amazon Bedrock

---

## Table of Contents

### Preface
- Why enterprise GenAI is an architecture problem, not a model problem
- Who this book is for: architects, technical design authorities and technology leaders
- How to read this book: the Architecture Pattern Blueprint
- The recurring visual language (🧩 ⚖️ 🔐 🌐 💷 ⚠️ 🏗️ 👁️ 🤖 📐)
- What this book deliberately avoids
- A note on emerging versus durable architecture

---

## Part I — Thinking Like a GenAI Architect

### Chapter 1: From Model Centric to Architecture Centric GenAI
- 1.1 The gap between an impressive proof of concept and a production system
- 1.2 Why prompts, models and RAG are not an architecture
- 1.3 The real question: how AI delivers value safely, reliably and economically at scale
- 1.4 The architect's mandate in enterprise GenAI
- 1.5 How the patterns in this book fit together

### Chapter 2: From Cloud Architecture to GenAI Architecture
- 2.1 What transfers from VPC, IAM, ECS, Lambda and API Gateway
- 2.2 What is genuinely new: context, probabilistic behaviour and autonomy
- 2.3 New concerns: model selection, data governance and AI specific operational risk
- 2.4 A mental bridge for the experienced AWS architect
- 2.5 How to read the rest of this book from that starting point

### Chapter 3: The Enterprise GenAI Problem Space
- 3.1 Enterprise complexity: data, identities, accounts, boundaries and processes
- 3.2 Control plane and data plane in GenAI systems
- 3.3 Trust boundaries, blast radius and tenancy
- 3.4 Centralisation, federation and distribution: a precise distinction
- 3.5 Constraints that shape every architectural decision

### Chapter 4: Foundation Models as an Architectural Concern
- 4.1 What an architect actually needs to know about foundation models
- 4.2 Inference, context, tokens and embeddings as system properties
- 4.3 Capability, latency and cost as design inputs
- 4.4 Open weight versus proprietary models: an architectural view
- 4.5 Grounding, determinism and the limits of model behaviour

### Chapter 5: Amazon Bedrock as an Architectural Building Block
- 5.1 Where Bedrock sits in an enterprise architecture
- 5.2 The Bedrock control plane and data plane
- 5.3 On demand and provisioned throughput as architectural choices
- 5.4 Regions, cross account inference and data residency
- 5.5 Positioning Bedrock, AgentCore and surrounding AWS services

---

## Part II — Core Architecture Patterns

### Chapter 6: Direct Bedrock Integration
- The architectural problem, pattern at a glance, and reference architecture
- Request and data flow, decisions and trade-offs
- Security, networking and failure modes for the simplest pattern
- When to use it, when not to, and the Architect's Verdict

### Chapter 7: The AI Gateway Pattern
- Centralising access, identity and policy enforcement for foundation models
- Control plane and data plane separation
- Governance, observability and cost control at the boundary
- Trade-offs, failure modes and the Architect's Verdict

### Chapter 8: Retrieval Augmented Generation (RAG) Architectures
- Grounding models in enterprise data
- Chunking, embeddings and indexing as architectural decisions
- Data ownership: shared versus local retrieval
- Networking, security and failure modes for RAG
- Pattern variations by organisational scale

### Chapter 9: Advanced Retrieval and Knowledge Architectures
- Hybrid search, re-ranking and retrieval quality
- Vector storage options on AWS and their trade-offs
- Ingestion pipelines, freshness and document lifecycle
- Multi source and multi domain knowledge grounding
- Evaluating retrieval as a first class concern

### Chapter 10: Model Routing and Model Selection
- Routing as an architectural capability, not a feature
- Cost, latency and capability trade-offs
- Fixed versus routed model selection
- Fallbacks, resilience and the economics of routing

### Chapter 11: Agentic Architectures
- 🤖 From inference to agentic workflows and tool calling
- Amazon Bedrock AgentCore as a building block
- Controlled autonomy, excessive agency and human in the loop
- Failure modes: tool failure, malformed responses and unbounded behaviour

### Chapter 12: Multi Agent Systems
- When multiple specialised agents collaborate
- Orchestration, boundaries and state
- Security and blast radius in multi agent designs
- When a simpler pattern is preferable

### Chapter 13: Memory, State and Long Running Workflows
- Statelessness versus stateful agentic systems
- Short term context and long term memory as architecture
- Durable workflows, checkpoints and orchestration services
- Consistency, recovery and cost implications of memory

---

## Part III — Enterprise Platform Architecture

### Chapter 14: Federated and Multi Account AI
- Application, AI, platform, security and logging accounts
- Balancing central governance with application level autonomy
- Where inference should occur and what identity reaches the model
- Cross account connectivity and isolation

### Chapter 15: Core GenAI — An Enterprise AI Platform Reference Architecture
- Treating GenAI as a platform capability rather than isolated features
- Bringing the AI Gateway, RAG, routing and agents together
- Federation, governance and self service for application teams
- Pattern variations from small organisation to highly regulated enterprise

### Chapter 16: AI Platform Engineering and Self Service
- The platform team and its operating model
- Golden paths, guardrails and paved roads for AI workloads
- Onboarding application teams without compromising governance
- Measuring platform adoption and health

### Chapter 17: Networking for GenAI
- 🌐 VPC design, subnets and routing for AI workloads
- VPC endpoints, PrivateLink and private inference paths
- Transit Gateway, DNS and cross account connectivity
- Ingress, egress and data exfiltration considerations

---

## Part IV — Security, Governance and Responsible AI

### Chapter 18: Identity, Access and Data Protection
- 🔐 IAM, least privilege and identity propagation to the model
- Authentication, authorisation and policy driven access
- KMS, encryption and data residency
- Auditability and account isolation

### Chapter 19: Guardrails and Policy Enforcement
- Guardrails for Amazon Bedrock as an architectural control
- Enforcing policy consistently across applications
- Content, topic and data controls at the boundary
- Controlled AI autonomy

### Chapter 20: Threat Modelling for GenAI Systems
- Prompt injection, data leakage and excessive agency by attack surface, likelihood and impact
- Tool and agent abuse as an attack path
- Supply chain and model provenance considerations
- Architectural controls versus fear based security

### Chapter 21: Governance and Responsible AI
- Model risk management and architectural accountability
- Transparency, evaluation and human oversight
- Distinguishing durable governance principles from emerging practice
- Governance that scales across a federated estate

---

## Part V — Production Grade Operations

### Chapter 22: Resilience and Failure Modes
- ⚠️ What happens when the architecture fails
- Model unavailability, throttling, regional outage and dependency failure
- Retrieval, agent and tool failure
- Mitigation, degradation and recovery strategies

### Chapter 23: Observability for GenAI Systems
- 👁️ Technical observability: latency, tokens, model usage and errors
- Guardrail events, agent and tool calls and retrieval performance
- Tracing requests across gateways, agents and models
- Dashboards, alerting and operational readiness

### Chapter 24: Evaluation and AI Quality
- Distinguishing AI quality evaluation from technical observability
- Automated and human evaluation approaches
- Detecting hallucination, regression and drift
- Feedback loops and continuous improvement

### Chapter 25: Performance, Scalability and Availability
- Latency, throughput and streaming as architectural concerns
- Caching for prompts, embeddings and responses
- Scaling patterns and their trade-offs
- Availability targets and their architectural cost

### Chapter 26: The Economics of GenAI and FinOps
- 💷 Understanding GenAI cost drivers across the system
- Token optimisation, embeddings, vector storage and data transfer
- Model selection and routing as cost mechanisms
- Cost allocation, chargeback and commercial sustainability

### Chapter 27: Delivery, Deployment and Change
- Infrastructure as code for GenAI platforms
- Versioning prompts, models, retrieval configuration and agents
- Deployment strategies, evaluation gates and rollback
- Managing change across a federated estate

---

## Part VI — Judgement and the Road Ahead

### Chapter 28: Architectural Trade-offs and Decision Making
- ⚖️ Applying the right complexity to the problem
- Reusable decision frameworks and checklists
- Why context determines the correct architecture
- Recognising when not to build a platform

### Chapter 29: Case Study — Designing an Enterprise GenAI Platform
- A hypothetical enterprise brief and its constraints
- Applying the patterns end to end
- The decisions made, the alternatives rejected and why
- Reviewing the design against the Architecture Decision Checklist

### Chapter 30: The Evolving GenAI Architecture Landscape
- Agentic and AI-native architectures
- Separating durable principles from rapidly changing capabilities
- Preparing an estate for change
- The enduring role of the GenAI architect

---

## Appendices
- Appendix A: The Architecture Pattern Blueprint (chapter structure reference)
- Appendix B: Architectural decision checklists
- Appendix C: Trade-off analysis templates
- Appendix D: Multi account AI reference topology
- Appendix E: Pattern selection guide (quick reference)
- Appendix F: Glossary of architectural and GenAI terms
- Appendix G: Further reading and references
