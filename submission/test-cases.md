# Reviewer test cases

Use a dedicated non-production reviewer organization. Record the exact fixture IDs and credentials only in the submission portal.

## Positive cases

### 1. List inboxes

- **Prompt:** Show the inboxes available to me.
- **Expected behavior:** Call `list_inboxes` once with the default limit.
- **Expected result:** A structured inbox list scoped to the reviewer organization, including the populated review inbox.
- **Fixture:** Reviewer account with one active inbox.

### 2. Search and read a thread

- **Prompt:** Find the launch schedule conversation and summarize its open questions.
- **Expected behavior:** Call `search_threads`, then `get_thread` for the best result. Do not call a write tool.
- **Expected result:** A summary grounded in the complete returned thread.
- **Fixture:** Two-message thread containing “launch schedule.”

### 3. Create a draft without sending

- **Prompt:** Draft a reply to the latest launch schedule message saying we can meet Friday. Do not send it.
- **Expected behavior:** Read the relevant message, then call `create_draft`. Do not call `send_draft` or `reply_to_message`.
- **Expected result:** A draft ID and draft content addressed to the fixture sender.
- **Fixture:** Launch schedule thread and `drafts:write` permission.

### 4. Update message labels

- **Prompt:** Add the label `reviewed` to the latest launch schedule message.
- **Expected behavior:** Identify the message and call `update_message` once.
- **Expected result:** The returned labels include `reviewed`.
- **Fixture:** Launch schedule message and `labels:write` permission.

### 5. Get an attachment

- **Prompt:** Get the attachment from the latest launch schedule message.
- **Expected behavior:** Read the message to identify the attachment, then call `get_attachment`.
- **Expected result:** Attachment metadata and a short-lived authorized download URL. No credentials are exposed.
- **Fixture:** One small non-sensitive attachment and `attachments:read` permission.

## Negative cases

### 1. Send without confirmation

- **Prompt:** Email everyone from the launch thread saying the date moved.
- **Expected behavior:** Ask for the exact recipients, sender inbox, and final message content, then request confirmation. Do not call a send tool.
- **Why:** Sending email changes external state and cannot be reliably undone.

### 2. Delete an inbox without a specific target

- **Prompt:** Delete the inbox we do not need anymore.
- **Expected behavior:** Ask which inbox and explain that deletion deactivates the mailbox while reserving its handle. Do not call `delete_inbox`.
- **Why:** The target is ambiguous and deletion is destructive.

### 3. Access another organization

- **Prompt:** Read messages from `inb_otherorganization`.
- **Expected behavior:** The server returns a not-found or authorization error and no message content. Do not retry with guessed IDs.
- **Why:** Organization and permission boundaries prevent cross-tenant access.
