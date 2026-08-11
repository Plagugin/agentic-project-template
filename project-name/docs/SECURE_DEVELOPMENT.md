# Security Guide

This document defines the project’s secure-development expectations, security architecture, review triggers, and validation practices.

It is intended for developers, reviewers, architects, operators, security specialists, and coding agents. Keep this document aligned with the current repository and organizational policy.

This file is not a substitute for a public vulnerability-reporting policy. If the repository needs instructions for external reporters, maintain a separate root-level `SECURITY.md` or organization-managed policy.

Replace every `<...>` placeholder before treating this document as authoritative. Remove sections that do not apply. Do not place secrets, credentials, private keys, production payloads, personal records, restricted incident details, or sensitive operational access information in this document.

## Document status

- **Project:** <project name>
- **Security owner:** <team, role, or individuals>
- **Technical owner:** <team, role, or individuals>
- **Data owner:** <team, role, or individuals>
- **Last reviewed:** <YYYY-MM-DD>
- **Review cadence:** <for example: annually and after material security changes>
- **Classification:** Public | Internal | Confidential
- **Related documents:**
  - `docs/PROJECT_CONTEXT.md`
  - `docs/ARCHITECTURE.md`
  - `docs/DEVELOPMENT.md`
  - `docs/TESTING.md`
  - `docs/DEFINITION_OF_DONE.md`
  - `<organization security policy>`
  - `<incident-response process>`
  - `<vulnerability-reporting policy>`

Remove references that do not apply or are not available to the intended audience.

## Purpose

This document explains:

- the project’s security objectives
- important assets and trust boundaries
- authentication and authorization expectations
- sensitive-data handling
- secret and credential management
- secure coding requirements
- dependency and supply-chain controls
- logging, audit, and observability requirements
- security testing and review triggers
- vulnerability and incident handling
- deployment and operational safeguards
- expectations for coding agents

Detailed system flows belong in `docs/ARCHITECTURE.md`. Exact test commands belong in `docs/TESTING.md`. Restricted incident runbooks should remain in the approved operational system.

## Security objectives

The project must:

- protect the confidentiality, integrity, and availability of its data and services
- enforce authentication and authorization at trusted boundaries
- minimize collection, processing, retention, and exposure of sensitive data
- prevent unauthorized privilege or trust escalation
- validate untrusted input and safely handle output
- protect secrets and credentials throughout their lifecycle
- preserve auditable evidence for security-relevant actions where required
- fail safely and visibly
- maintain secure dependency and build practices
- make material security assumptions and residual risks explicit

Project-specific priorities:

1. <priority>
2. <priority>
3. <priority>

## Scope

### In scope

This security guide applies to:

- <application, service, package, or repository>
- <APIs or interfaces>
- <data stores>
- <deployment components>
- <integrations>
- <development and CI/CD workflows>

### Out of scope

This document does not define security controls for:

- <system owned elsewhere>
- <organization-managed infrastructure>
- <external identity provider>
- <external payment or regulated processor>
- <physical security>
- <manual process>

For each out-of-scope area, identify the owner and relevant policy.

## Security ownership and contacts

| Responsibility | Owner | Escalation |
|---|---|---|
| Product security decisions | <owner> | <path> |
| Application security | <owner> | <path> |
| Infrastructure security | <owner> | <path> |
| Identity and access | <owner> | <path> |
| Data protection and privacy | <owner> | <path> |
| Vulnerability management | <owner> | <path> |
| Incident response | <owner> | <path> |
| Dependency or supply-chain security | <owner> | <path> |

Use `Not yet confirmed` rather than inferring ownership from commit history.

## Security decision authority

Explicit approval is required for changes involving:

- authentication or identity providers
- authorization models or permission boundaries
- cryptographic algorithms, protocols, or key management
- new sensitive-data categories
- changes to retention, deletion, or export
- new public network exposure
- new external integrations
- new trust boundaries
- new privileged operations
- breaking security controls
- security logging or audit changes
- major dependencies with elevated privileges
- production secret-management changes
- changes to incident detection or response

| Decision type | Required approver |
|---|---|
| Authentication model | <role or team> |
| Authorization model | <role or team> |
| Sensitive-data handling | <role or team> |
| Cryptography | <role or team> |
| External exposure | <role or team> |
| Security exceptions | <role or team> |

## Security context

### Protected assets

| Asset | Why it matters | Owner | Classification |
|---|---|---|---|
| <asset> | <importance> | <owner> | Public / Internal / Confidential / Restricted |

Examples include:

- user or customer data
- credentials and secrets
- business-critical records
- intellectual property
- configuration
- audit evidence
- signing keys
- deployment pipelines
- administrative functionality
- service availability

### Threat actors

Consider relevant actors such as:

- unauthenticated external users
- authenticated users acting outside their authority
- compromised accounts
- malicious insiders
- compromised dependencies
- automated abuse
- misconfigured services
- compromised integration partners
- accidental operator error

Only include threat actors relevant to the system.

### Security assumptions

- <assumption>
- <assumption>

Do not treat assumptions as controls. Record how each material assumption is validated.

### Trust boundaries

Document where data or control crosses between different trust levels.

| Boundary | From | To | Controls |
|---|---|---|---|
| <boundary> | <source> | <destination> | <controls> |

Examples include:

- public network to edge layer
- browser or client to server
- application to database
- service to external provider
- standard user to administrator
- CI system to deployment environment
- tenant to tenant
- local development to shared test environment

Reference detailed diagrams in `docs/ARCHITECTURE.md`.

## Security invariants

These rules must remain true across implementation changes.

### Identity invariants

- <identity rule>
- <identity rule>

### Authorization invariants

- <authorization rule>
- <authorization rule>

### Data invariants

- <sensitive-data rule>
- <integrity or ownership rule>

### Secret invariants

- Secrets must not be committed to the repository.
- Secrets must not be logged.
- <project-specific rule>

### Audit invariants

- <security-relevant action must be auditable>
- <audit records must be protected from unauthorized modification>

### Network invariants

- <network exposure rule>
- <transport-security rule>

Any proposed change that violates or redefines an invariant requires explicit security review.

## Data classification

Use the project or organizational classification scheme.

| Classification | Description | Example | Minimum handling |
|---|---|---|---|
| Public | Approved for public disclosure | <example> | Standard integrity controls |
| Internal | Intended for authorized internal use | <example> | Access control and approved storage |
| Confidential | Disclosure could cause harm | <example> | Restricted access, encryption, limited logging |
| Restricted | Highly sensitive or regulated | <example> | Strong access, encryption, audit, minimum retention |

Adapt classifications to organizational policy.

## Data inventory

| Data category | Classification | Purpose | Source | Storage | Retention | Owner |
|---|---|---|---|---|---|---|
| <category> | <classification> | <purpose> | <source> | <storage> | <retention> | <owner> |

### Personal data

The project processes:

- <personal-data category or `No personal data confirmed`>

For each category, document:

- purpose and necessity
- source
- lawful or approved basis where applicable
- access roles
- sharing
- retention
- deletion or anonymization
- audit requirements

### Sensitive-data minimization

- Collect only data necessary for the approved purpose.
- Avoid copying sensitive data into logs, analytics, events, tests, or support tools.
- Prefer identifiers or redacted values over full records.
- Remove unused fields and legacy retention when approved.
- Do not use production data for development or routine testing.

### Data lifecycle

| Stage | Control |
|---|---|
| Collection | <validation, notice, minimization> |
| Processing | <access and purpose limitation> |
| Storage | <encryption, isolation, retention> |
| Transmission | <transport security and recipient validation> |
| Sharing | <approval and contract controls> |
| Archival | <policy> |
| Deletion | <process and verification> |

## Privacy

Where applicable:

- implement privacy by design and data minimization
- document data purposes
- support approved access, correction, export, deletion, or restriction processes
- avoid creating shadow data stores
- define retention and deletion ownership
- ensure telemetry and analytics follow approved consent and policy
- review cross-border or third-party data transfers
- document backup and replica implications for deletion

Privacy-impact review is required when:

- adding a new personal-data category
- changing purpose
- changing retention
- adding a recipient or processor
- introducing profiling or automated decisions
- exporting data
- changing user controls
- combining previously separate data sets

## Authentication

### Identity types

| Identity type | Examples | Authentication source |
|---|---|---|
| Human user | <examples> | <provider> |
| Administrator | <examples> | <provider> |
| Service identity | <examples> | <provider> |
| Automation identity | <examples> | <provider> |

### Authentication model

Document:

- identity provider
- supported authentication methods
- token or session type
- token validation
- issuer and audience validation
- expiry
- refresh
- revocation
- logout
- multi-factor requirements
- machine-to-machine authentication
- local-development behavior

### Authentication requirements

- Authentication must be enforced at the trusted server or service boundary.
- Credentials must not be accepted through insecure channels.
- Tokens must be validated completely, not merely decoded.
- Authentication failures must not reveal unnecessary account information.
- Session fixation and replay risks must be addressed where relevant.
- Expired, revoked, malformed, and wrong-audience credentials must be rejected.
- Test-only authentication bypasses must not be active in production.

### Administrative authentication

Administrative access requires:

- <stronger authentication control>
- <approved account class>
- <network or device control>
- <audit requirement>

## Authorization

### Authorization model

- **Model:** RBAC | ABAC | ACL | Capability-based | Policy-based | Other
- **Policy owner:** <owner>
- **Enforcement points:** <locations>
- **Permission source:** <source>
- **Caching behavior:** <behavior>
- **Revocation behavior:** <behavior>

### Authorization requirements

- Enforce authorization at a trusted boundary for every protected action.
- Do not rely solely on hidden UI controls.
- Check permission against the actual resource and action.
- Protect against horizontal and vertical privilege escalation.
- Apply tenant, organization, account, or ownership isolation consistently.
- Default to denial when policy cannot be evaluated safely.
- Avoid broad wildcard permissions.
- Revalidate authorization when resource ownership or context changes.
- Audit privileged and security-sensitive actions where required.

### Authorization test matrix

| Actor | Resource | Action | Expected result |
|---|---|---|---|
| <actor> | <resource> | <action> | Allow / Deny |

Include both positive and negative cases in automated tests.

### Impersonation and delegation

Document:

- whether impersonation exists
- who may use it
- user notice
- audit behavior
- duration
- restrictions
- termination
- prohibited uses

Use `Not applicable` if absent.

## Tenant isolation

Use this section when the system is multi-tenant.

Document:

- tenant identification
- tenant context propagation
- data partitioning
- authorization
- cache keys
- logs and metrics
- background jobs
- administration
- export and deletion
- tests

Tenant identifiers must come from a trusted source, not from unvalidated user input alone.

Use `Not applicable` for single-tenant systems.

## Input validation

Treat all data crossing a trust boundary as untrusted until validated.

### Validation rules

- Validate type, structure, length, range, format, and allowed values.
- Reject ambiguous or unsupported encodings.
- Normalize only when semantics are well defined.
- Validate after decoding and before use.
- Apply context-specific validation.
- Avoid deny-list-only validation for structured inputs.
- Preserve consistent validation across alternate entry points.
- Limit collection size, nesting, recursion, and decompression.
- Return safe error responses without exposing internals.

### Validation boundaries

| Input source | Validation point | Schema or validator |
|---|---|---|
| <source> | <boundary> | `<path>` |

### Common high-risk inputs

Review carefully:

- identifiers used for authorization
- file paths
- URLs and redirects
- regular expressions
- shell arguments
- SQL or query fragments
- templates
- serialized objects
- archive files
- images and documents
- webhook payloads
- uploaded files
- pagination and sorting fields
- callback addresses

## Output handling

Use context-appropriate output encoding.

Consider:

- HTML
- JavaScript
- CSS
- URLs
- HTTP headers
- SQL
- shell commands
- logs
- CSV and spreadsheet formulas
- JSON and XML
- file paths
- templates

Do not reuse one encoding strategy for every context.

Avoid exposing:

- stack traces
- internal paths
- infrastructure names
- secret values
- sensitive identifiers
- internal exception details
- authorization logic
- dependency versions unless intentionally public

## API security

For APIs, document:

- authentication
- authorization
- input schemas
- output schemas
- rate limits
- pagination limits
- idempotency
- replay protection
- error model
- versioning
- deprecation
- audit requirements
- CORS
- content-type handling

Requirements:

- Reject unsupported methods and media types.
- Enforce request-size and field-count limits.
- Validate identifiers and resource ownership.
- Apply rate and abuse controls where justified.
- Avoid mass-assignment vulnerabilities.
- Protect sensitive fields from accidental serialization.
- Use consistent error behavior.
- Do not expose internal object models directly without review.

## Web application security

Use this section when applicable.

Consider:

- cross-site scripting
- cross-site request forgery
- clickjacking
- content security policy
- secure cookies
- session handling
- CORS
- open redirects
- browser storage
- mixed content
- dependency and asset integrity
- cache-control for sensitive pages

### Security headers

| Header | Expected behavior |
|---|---|
| Content-Security-Policy | <policy> |
| Strict-Transport-Security | <policy> |
| X-Content-Type-Options | `nosniff` or approved equivalent |
| Referrer-Policy | <policy> |
| Permissions-Policy | <policy> |
| Frame protections | <policy> |

Adapt to the application and deployment edge.

## File and content handling

For uploads, downloads, archives, and generated files:

- validate content and metadata
- do not trust file extensions
- enforce size and count limits
- use safe generated filenames
- isolate storage from executable application paths
- prevent path traversal
- avoid serving active content from trusted origins without controls
- scan or inspect files where required
- set safe response headers
- protect against archive bombs and nested expansion
- clean up temporary files
- validate authorization for every read and write
- avoid processing untrusted files with excessive privilege

| File type or operation | Controls |
|---|---|
| <type> | <controls> |

## Injection prevention

Never concatenate untrusted input into:

- SQL
- shell commands
- LDAP queries
- templates
- expressions
- regular expressions without control
- dynamic code
- path expressions
- query languages

Use parameterized or structured APIs.

If command execution is unavoidable:

- use fixed executable paths
- pass arguments without shell interpretation
- enforce allow lists
- restrict privileges
- set timeouts
- capture output safely
- avoid secrets in command lines
- document and test the boundary

## Server-side request forgery

For outbound requests influenced by input:

- allow only approved schemes
- validate destinations after resolution
- block local, private, metadata, and restricted address ranges where appropriate
- handle redirects safely
- limit ports
- set timeouts and response limits
- avoid forwarding ambient credentials
- use outbound proxies or allow lists when required
- validate DNS rebinding risk
- log safe destination metadata for audit where appropriate

## Deserialization and parsing

- Prefer simple, well-defined formats.
- Avoid unsafe object deserialization.
- Use strict schemas.
- Limit nesting, depth, size, and processing time.
- Reject unknown types where possible.
- Treat parsers as security boundaries.
- Keep parser dependencies maintained.
- Test malformed and adversarial inputs.

## Cryptography

### Approved cryptography

- Use organization-approved cryptographic libraries and platform facilities.
- Do not design custom cryptographic algorithms or protocols.
- Do not implement custom password hashing.
- Use approved random-number generators.
- Use authenticated encryption where applicable.
- Validate certificates and hostnames.
- Use modern protocol versions and cipher suites.
- Separate encryption keys from encrypted data.
- Define key rotation and revocation.

### Cryptographic inventory

| Purpose | Algorithm or service | Key owner | Rotation |
|---|---|---|---|
| <purpose> | <approved method> | <owner> | <policy> |

Do not record secret key material.

### Passwords and authentication secrets

- Store passwords only with an approved adaptive password-hashing function.
- Apply appropriate rate limiting and abuse controls.
- Do not log or echo passwords.
- Use secure reset and recovery workflows.
- Invalidate or rotate credentials after compromise.

## Secrets and credentials

### Approved storage

| Environment | Approved mechanism |
|---|---|
| Local development | <mechanism> |
| CI/CD | <mechanism> |
| Test | <mechanism> |
| Production | <mechanism> |

### Secret lifecycle

Document:

- creation
- owner
- intended scope
- distribution
- storage
- rotation
- expiry
- revocation
- incident handling
- deletion

### Secret requirements

- Never commit secrets.
- Never place secrets in documentation, prompts, fixtures, snapshots, or logs.
- Avoid secrets in command-line arguments.
- Use least privilege and narrow scope.
- Prefer short-lived credentials.
- Rotate credentials when exposure is suspected.
- Keep test and production credentials separate.
- Prevent secrets from reaching client-side code.
- Redact secrets from error reports and telemetry.

### Secret scanning

```sh
<secret scanning command>
```

Document the CI control and remediation process.

## Logging, telemetry, and audit

### Logging principles

Log enough to diagnose and secure the system without exposing sensitive data.

Do not log:

- passwords
- session secrets
- access or refresh tokens
- private keys
- full payment or regulated identifiers
- unnecessary personal data
- full sensitive payloads
- authentication headers
- secret configuration values

### Safe logging

Prefer:

- correlation identifiers
- stable event names
- redacted or hashed identifiers when approved
- outcome and reason categories
- safe metadata
- actor and resource identifiers only when policy allows

### Security events

| Event | Required fields | Retention | Alert |
|---|---|---|---|
| Authentication failure | <fields> | <retention> | <condition> |
| Authorization denial | <fields> | <retention> | <condition> |
| Privileged action | <fields> | <retention> | <condition> |
| Configuration change | <fields> | <retention> | <condition> |
| Sensitive-data export | <fields> | <retention> | <condition> |

### Audit requirements

Audit records should be:

- attributable
- timestamped
- protected from unauthorized modification
- access-controlled
- retained according to policy
- searchable for approved investigations
- free of unnecessary sensitive payloads

## Error handling

- Fail closed for security decisions.
- Do not reveal sensitive internal details.
- Distinguish user errors from internal failures.
- Preserve diagnostic detail in protected internal channels.
- Avoid inconsistent authorization errors that enable resource enumeration.
- Set safe timeouts.
- Handle partial failure.
- Do not suppress security failures merely to preserve availability.

## Resource and abuse controls

Consider:

- rate limiting
- quotas
- request-size limits
- pagination limits
- concurrency limits
- timeouts
- circuit breakers
- queue bounds
- upload limits
- query-cost limits
- account lockout or progressive delay
- bot or automation controls
- replay prevention

Document controls and expected failure behavior.

## Network security

Document:

- public endpoints
- internal endpoints
- ingress controls
- egress controls
- transport encryption
- certificate management
- service identity
- firewall or security-group ownership
- private connectivity
- DNS controls
- proxy behavior
- trusted forwarding headers

Requirements:

- Encrypt sensitive traffic in transit.
- Validate peer identity.
- Do not trust forwarding headers unless set by an approved proxy.
- Restrict administrative interfaces.
- Apply least-privilege egress where practical.
- Do not expose development or debug endpoints publicly.

## Infrastructure and platform security

Use this section when the repository defines infrastructure.

- use approved base images and platforms
- minimize privileges
- avoid privileged containers
- use read-only filesystems where practical
- drop unnecessary capabilities
- avoid running as root
- set resource limits
- separate environments
- protect metadata services
- manage secrets through approved mechanisms
- scan infrastructure definitions
- review public exposure
- pin or control trusted artifacts
- define patching ownership

| Area | Control | Configuration |
|---|---|---|
| Container runtime | <control> | `<path>` |
| Cloud identity | <control> | `<path>` |
| Network | <control> | `<path>` |
| Storage | <control> | `<path>` |
| Secrets | <control> | `<path>` |

## Dependency and supply-chain security

### Dependency requirements

Before adding a dependency:

- confirm the need
- prefer existing or standard-library functionality
- review project health and maintenance
- review known vulnerabilities
- review license requirements
- verify runtime and platform compatibility
- minimize transitive impact
- pin or lock versions according to project policy
- avoid packages with unnecessary install-time execution or privilege

### Dependency controls

```sh
<dependency audit command>
<license check command>
<integrity verification command>
```

### Build integrity

Document:

- trusted build environment
- dependency sources
- lockfile policy
- artifact signing
- provenance
- build reproducibility
- generated-file verification
- release approval
- artifact storage
- promotion between environments

### CI/CD security

- Use least-privilege tokens.
- Pin third-party actions or build components where policy requires.
- Protect deployment environments.
- Prevent untrusted code from accessing privileged secrets.
- Review pull-request workflows from forks.
- Separate build and deployment authority.
- Preserve audit evidence.
- Restrict manual overrides.
- Rotate compromised credentials.
- Do not expose secrets in logs or artifacts.

## Code review

Security-focused review is required when changes affect:

- authentication
- authorization
- sensitive-data processing
- trust boundaries
- cryptography
- secrets
- file or network access
- parsers
- external integrations
- privileged operations
- dependency or build integrity
- security logging
- tenant isolation
- administrative functionality

Reviewers should verify:

- threat assumptions
- failure behavior
- negative authorization paths
- input and output handling
- least privilege
- sensitive-data minimization
- compatibility
- tests
- operational visibility
- rollback or recovery

## Security testing

Detailed commands and test structure belong in `docs/TESTING.md`.

Relevant checks may include:

- authentication tests
- authorization and negative permission tests
- input-validation tests
- injection tests
- path and file handling
- cross-tenant access tests
- secret scanning
- dependency scanning
- static analysis
- dynamic analysis
- container or infrastructure scanning
- contract and schema validation
- rate-limit and abuse tests
- fuzzing
- manual review
- penetration testing

Commands:

```sh
<security test command>
<static analysis command>
<dependency scan command>
<secret scan command>
```

Never report a security check as passed unless it actually ran successfully.

## Threat modeling

Threat modeling is required for:

- a new externally accessible service
- a new trust boundary
- a new sensitive-data flow
- a new identity or authorization model
- a privileged feature
- a major integration
- a significant architecture change
- high-risk file, parser, or network processing
- material changes to tenant isolation

### Threat-model template

```markdown
# Threat Model: <feature or system>

## Scope

<What is included and excluded?>

## Assets

- <asset>

## Actors

- <actor>

## Trust boundaries

- <boundary>

## Data flows

- <flow>

## Threats

| Threat | Scenario | Existing control | Additional action | Owner |
|---|---|---|---|---|
| <threat> | <scenario> | <control> | <action> | <owner> |

## Residual risk

<Accepted or unresolved risk and approver.>
```

Store threat models at `<path>`.

## Security review triggers

A security review is required when a change:

- creates new public exposure
- changes authentication
- changes authorization
- adds privileged functionality
- handles new sensitive data
- changes retention or deletion
- introduces a new integration
- changes cryptography
- introduces executable content or file parsing
- adds a major dependency
- changes deployment identity or network policy
- changes audit behavior
- affects tenant isolation
- bypasses an existing security control
- accepts a security exception

## Vulnerability management

### Reporting

- **Internal reporting path:** <path>
- **External reporting policy:** <path or `Not applicable`>
- **Emergency contact:** <role or managed process>
- **Do not report vulnerabilities through:** <unsafe channels>

Do not include personal contact details unless approved for publication.

### Triage

Record:

- affected component
- severity
- exploitability
- affected versions
- data or privilege impact
- mitigating controls
- remediation owner
- target resolution
- communication plan
- regression tests
- disclosure requirements

### Remediation

- reproduce safely
- preserve evidence
- fix the root cause
- add regression coverage
- assess related code paths
- rotate or revoke exposed secrets
- review logs and indicators where appropriate
- update documentation and advisories
- validate deployment
- record residual risk

### Security exceptions

Every exception must include:

- control being bypassed
- reason
- scope
- risk
- compensating controls
- owner
- approver
- expiry or review date
- removal plan

Do not create permanent undocumented exceptions.

## Incident response

Follow the approved incident-response process.

At a high level:

1. Detect and preserve evidence.
2. Escalate through the approved channel.
3. Contain without destroying necessary evidence.
4. Assess scope and impact.
5. Eradicate the cause.
6. Recover safely.
7. Monitor for recurrence.
8. Complete post-incident review.
9. Track corrective actions.

Do not include restricted incident contacts, credentials, or containment commands in a broadly visible repository document.

## Secure development environments

Developers and coding agents must:

- use supported tooling
- keep dependencies and local tooling maintained
- avoid using production data
- avoid placing secrets in prompts
- use approved credential mechanisms
- prevent local services from unnecessary public exposure
- review downloaded scripts before execution
- avoid global installation when project-local tooling is available
- keep test and production identities separate
- clean up temporary sensitive files

## Secure defaults

New functionality should default to:

- denied access until explicitly granted
- private rather than public exposure
- minimum necessary data
- minimum necessary privilege
- secure transport
- strict validation
- bounded resource use
- conservative error disclosure
- disabled debug behavior
- auditable privileged actions
- short retention where policy allows

## Feature flags and temporary controls

Security controls must not be disabled by ordinary feature flags.

When a temporary flag affects security:

- document the risk
- restrict who can change it
- define a safe default
- audit changes
- set an expiry
- define removal criteria
- test both states
- prevent unauthorized production activation

## Backups and recovery

Security requirements include:

- encrypted backups where required
- access control
- retention
- deletion policy
- restore testing
- integrity verification
- separation of duties
- incident recovery
- consideration of deleted or corrected data in backups

Document ownership without exposing sensitive backup locations or credentials.

## Decommissioning

When retiring a component:

- remove public exposure
- revoke credentials and certificates
- remove permissions
- archive or delete data according to policy
- remove DNS and integration references
- disable pipelines
- remove secrets
- preserve required audit records
- notify owners and consumers
- verify no active dependency remains

## Security checklist for changes

Before completing a change, consider:

- [ ] Does the change cross a trust boundary?
- [ ] Does it affect authentication?
- [ ] Does it affect authorization?
- [ ] Does it add or change sensitive data?
- [ ] Is input validated at the correct boundary?
- [ ] Is output encoded safely?
- [ ] Could it introduce injection?
- [ ] Does it access files, URLs, networks, or commands?
- [ ] Are secrets handled correctly?
- [ ] Are logs free of sensitive values?
- [ ] Is privilege minimized?
- [ ] Are rate and resource limits needed?
- [ ] Does it introduce a dependency or supply-chain risk?
- [ ] Does it require a threat model?
- [ ] Are negative security tests included?
- [ ] Is audit behavior sufficient?
- [ ] Is failure safe and diagnosable?
- [ ] Are rollback and recovery understood?
- [ ] Is explicit security approval required?

## Agent guidance

A coding agent must:

1. Read applicable security instructions before modifying security-relevant code.
2. Inspect the existing authentication, authorization, validation, secret, and logging patterns.
3. Preserve current trust and privilege boundaries unless an approved plan changes them.
4. Use repository-supported security tools and test commands.
5. Add negative tests for unauthorized and malformed behavior where relevant.
6. Avoid exposing sensitive data in prompts, logs, code, fixtures, or completion reports.
7. Stop before making an unapproved material security decision.
8. Report security assumptions, deviations, tests, and residual risks truthfully.

A coding agent must not:

- weaken security controls merely to make implementation or tests easier
- create a bypass intended only for agents or automation
- commit secrets
- print secret values
- contact production services
- modify cloud or identity systems without explicit authorization
- add custom cryptography
- approve its own material security exception
- claim a security test passed when it was not run

## Definition of secure completion

Security-relevant work is complete only when:

- the approved security behavior is implemented
- trust boundaries and permissions remain intentional
- sensitive-data handling is documented and minimized
- input and output controls are present
- secrets are handled through approved mechanisms
- relevant positive and negative tests exist
- applicable scans or reviews have run
- logging and audit behavior are appropriate
- compatibility, rollout, rollback, and recovery are addressed
- no known secret or sensitive-data exposure remains
- residual risks and exceptions are documented and approved
- the final diff has been reviewed

This definition complements `docs/DEFINITION_OF_DONE.md`.

## Known security risks

| Risk | Likelihood | Impact | Mitigation | Owner | Review trigger |
|---|---|---|---|---|---|
| <risk> | Low / Medium / High | Low / Medium / High | <mitigation> | <owner> | <trigger> |

Do not disclose exploitable detail in a broadly visible document. Store restricted findings in the approved security system.

## Open security questions

- **SEC-Q-001:** <question>
  - **Why it matters:** <impact>
  - **Owner:** <role or team>
  - **Required before:** <milestone or change>

Remove resolved questions and update the appropriate authoritative section.

## Evidence map

| Security statement | Repository evidence |
|---|---|
| <statement> | `<path>` — <symbol, section, or configuration> |
| <statement> | `<path>` — <symbol, section, or configuration> |

Use this section to prevent documentation drift without exposing restricted details.

## Maintenance

Review this document when:

- authentication or authorization changes
- new sensitive data is introduced
- a source of truth changes
- a trust boundary changes
- a public interface is introduced
- a major integration or dependency is added
- secret-management changes
- deployment identity or network exposure changes
- a material vulnerability or incident occurs
- security tools or policies change
- coding agents repeatedly make the same security mistake

During review:

- verify ownership
- verify trust boundaries
- verify data classifications
- verify authentication and authorization descriptions
- verify security commands and configuration paths
- remove stale exceptions
- remove obsolete risks
- ensure no sensitive operational details or secrets are present
- update the last-reviewed date
