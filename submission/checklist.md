# Submission checklist

## Public repository

- [ ] GitHub repository is public under the verified publisher organization.
- [ ] `claude plugin validate .` passes from the repository root.
- [ ] `npx skills add aadi-labs/agentmailer-plugins --list` discovers all four skills.
- [ ] Codex repo marketplace installs in a clean desktop environment.
- [ ] Claude marketplace and plugin install in a clean Claude Code environment.
- [ ] Repository About description, website, and topics are set for discovery.

## Deployed service

- [ ] MCP endpoint and OAuth metadata return expected responses from the public internet.
- [ ] MCP initialization advertises `io.modelcontextprotocol/skills` under `capabilities.extensions`.
- [ ] `skills/list`, `skills/get`, and `resources/read` expose all four skills, and every returned resource matches its SHA-256 digest.
- [ ] Every tool has a title and accurate `readOnlyHint`, `openWorldHint`, and `destructiveHint` annotations.
- [ ] Public documentation, privacy, terms, and support URLs return `200`.
- [ ] Every submitted tool passes an end-to-end reviewer-account run.
- [ ] Tool responses contain no unnecessary secrets, internal identifiers, debug payloads, or undisclosed personal data.

## Reviewer account

- [ ] Dedicated non-production organization is populated with the fixtures in `test-cases.md`.
- [ ] Login works without MFA, SMS, email confirmation, or private network access.
- [ ] Permissions cover every submitted tool.
- [ ] Credentials and exact login instructions are stored only in each provider portal.
- [ ] `support@agentmailer.ai` receives external mail.
- [ ] Privacy and terms have business-owner or counsel approval.

## Anthropic Connector Directory

- [ ] Submit the universal remote MCP server through Claude organization settings.
- [ ] Portal sync recognizes every tool title and annotation.
- [ ] Listing, use cases, company, authentication, data handling, and test instructions are complete.
- [ ] Submitter personally completes the required compliance acknowledgments.

## Anthropic Plugin Directory

- [ ] Submit the public GitHub plugin URL through Claude.ai or Console.
- [ ] GitHub URL points at the public repository root or marketplace as requested by the portal.
- [ ] Automated plugin screening passes.

## OpenAI Plugins Directory

- [ ] Submitter has Apps Management write access in the owning organization.
- [ ] Aadi Labs developer or business identity is verified and matches the public listing.
- [ ] Create a new **With MCP** submission using the Universal URL.
- [ ] Complete the portal-provided domain challenge at `/.well-known/openai-apps-challenge` without replacing another plugin's active token.
- [ ] Import the final four skills from the deployed MCP server with Scan Tools.
- [ ] Re-run Scan Tools after every deployed skill change because the directory stores a static snapshot.
- [ ] Enter the five positive and three negative cases from `test-cases.md`.
- [ ] Select only regions where product support and legal terms are ready.
- [ ] Submitter personally completes the policy attestations.

## Additional ecosystem discovery

- [ ] Publish `@aadi-labs/agentmailer` publicly to npm after confirming Aadi Labs scope access, then verify its `pi-package` gallery listing and Git install in a clean Pi environment.
- [ ] Verify the OpenCode skills install, MCP OAuth, and one authenticated tool call in a clean environment; submit the repository to OpenCode's ecosystem list if it accepts integrations that are not event-hook plugins.
- [ ] Run native OpenClaw manifest/runtime inspection, package validation, and a ClawHub publish dry-run before publishing under the verified Aadi Labs owner.
- [ ] Verify native Hermes `plugin.yaml` discovery, skill registration, OAuth MCP login, and installation from an immutable AgentMailer commit.
