# Reference
## agent
<details><summary><code>client.agent.<a href="/src/api/resources/agent/client/Client.ts">bootstrap</a>({ ...params }) -> AgentMailer.BootstrapResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.agent.bootstrap();

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `AgentMailer.BootstrapRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `AgentClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.agent.<a href="/src/api/resources/agent/client/Client.ts">signUp</a>({ ...params }) -> AgentMailer.SignUpAgentResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.agent.signUp({
    human_email: "human_email",
    username: "username"
});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `AgentMailer.SignUpAgentRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `AgentClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## inboxes
<details><summary><code>client.inboxes.<a href="/src/api/resources/inboxes/client/Client.ts">list</a>({ ...params }) -> AgentMailer.ListInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.inboxes.list();

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `AgentMailer.ListInboxesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `InboxesClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/src/api/resources/inboxes/client/Client.ts">create</a>({ ...params }) -> AgentMailer.CreateInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.inboxes.create();

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `AgentMailer.InboxCreate` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `InboxesClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/src/api/resources/inboxes/client/Client.ts">get</a>(inboxId) -> AgentMailer.GetInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.inboxes.get("inboxId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `InboxesClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/src/api/resources/inboxes/client/Client.ts">delete</a>(inboxId) -> void</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.inboxes.delete("inboxId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `InboxesClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/src/api/resources/inboxes/client/Client.ts">update</a>(inboxId, { ...params }) -> AgentMailer.UpdateInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.inboxes.update("inboxId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.InboxUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `InboxesClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/src/api/resources/inboxes/client/Client.ts">issueCredentials</a>(inboxId) -> AgentMailer.IssueCredentialsInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.inboxes.issueCredentials("inboxId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `InboxesClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## messages
<details><summary><code>client.messages.<a href="/src/api/resources/messages/client/Client.ts">list</a>(inboxId, { ...params }) -> AgentMailer.ListMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.messages.list("inboxId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.ListMessagesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `MessagesClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/src/api/resources/messages/client/Client.ts">send</a>(inboxId, { ...params }) -> AgentMailer.SendMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.messages.send("inboxId", {
    to: ["to"]
});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.MessageCompose` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `MessagesClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/src/api/resources/messages/client/Client.ts">get</a>(inboxId, messageId) -> AgentMailer.GetMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.messages.get("inboxId", "messageId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**messageId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `MessagesClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/src/api/resources/messages/client/Client.ts">delete</a>(inboxId, messageId) -> void</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.messages.delete("inboxId", "messageId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**messageId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `MessagesClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/src/api/resources/messages/client/Client.ts">reply</a>(inboxId, messageId, { ...params }) -> AgentMailer.ReplyMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.messages.reply("inboxId", "messageId", {});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**messageId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.ReplyCompose` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `MessagesClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/src/api/resources/messages/client/Client.ts">replyAll</a>(inboxId, messageId, { ...params }) -> AgentMailer.ReplyAllMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.messages.replyAll("inboxId", "messageId", {});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**messageId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.ReplyCompose` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `MessagesClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/src/api/resources/messages/client/Client.ts">forward</a>(inboxId, messageId, { ...params }) -> AgentMailer.ForwardMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.messages.forward("inboxId", "messageId", {
    to: ["to"]
});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**messageId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.MessageCompose` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `MessagesClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## threads
<details><summary><code>client.threads.<a href="/src/api/resources/threads/client/Client.ts">list</a>(inboxId, { ...params }) -> AgentMailer.ListThreadsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.threads.list("inboxId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.ListThreadsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `ThreadsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.threads.<a href="/src/api/resources/threads/client/Client.ts">get</a>(inboxId, threadId) -> AgentMailer.GetThreadsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.threads.get("inboxId", "threadId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**threadId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `ThreadsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## drafts
<details><summary><code>client.drafts.<a href="/src/api/resources/drafts/client/Client.ts">list</a>(inboxId) -> AgentMailer.ListDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.drafts.list("inboxId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `DraftsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/src/api/resources/drafts/client/Client.ts">create</a>(inboxId, { ...params }) -> AgentMailer.CreateDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.drafts.create("inboxId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.DraftCreate` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `DraftsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/src/api/resources/drafts/client/Client.ts">get</a>(inboxId, draftId) -> AgentMailer.GetDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.drafts.get("inboxId", "draftId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**draftId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `DraftsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/src/api/resources/drafts/client/Client.ts">delete</a>(inboxId, draftId) -> void</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.drafts.delete("inboxId", "draftId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**draftId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `DraftsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/src/api/resources/drafts/client/Client.ts">update</a>(inboxId, draftId, { ...params }) -> AgentMailer.UpdateDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.drafts.update("inboxId", "draftId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**draftId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.DraftUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `DraftsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/src/api/resources/drafts/client/Client.ts">send</a>(inboxId, draftId) -> AgentMailer.SendDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.drafts.send("inboxId", "draftId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**draftId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `DraftsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## attachments
<details><summary><code>client.attachments.<a href="/src/api/resources/attachments/client/Client.ts">upload</a>(inboxId, { ...params }) -> Record&lt;string, unknown&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.attachments.upload("inboxId", {
    filename: "filename",
    contentType: "contentType",
    size: 1,
    checksumSha256: "checksumSha256"
});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.AttachmentUploadCreate` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `AttachmentsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attachments.<a href="/src/api/resources/attachments/client/Client.ts">complete</a>(inboxId, attachmentId) -> AgentMailer.CompleteAttachmentsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.attachments.complete("inboxId", "attachmentId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**attachmentId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `AttachmentsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attachments.<a href="/src/api/resources/attachments/client/Client.ts">download</a>(inboxId, attachmentId) -> AgentMailer.DownloadAttachmentsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.attachments.download("inboxId", "attachmentId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**attachmentId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `AttachmentsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## pods
<details><summary><code>client.pods.<a href="/src/api/resources/pods/client/Client.ts">list</a>() -> AgentMailer.ListPodsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.pods.list();

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `PodsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/src/api/resources/pods/client/Client.ts">create</a>({ ...params }) -> AgentMailer.CreatePodsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.pods.create({
    name: "name"
});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `AgentMailer.PodCreate` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `PodsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/src/api/resources/pods/client/Client.ts">get</a>(podId) -> AgentMailer.GetPodsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.pods.get("podId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**podId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `PodsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/src/api/resources/pods/client/Client.ts">delete</a>(podId) -> void</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.pods.delete("podId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**podId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `PodsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/src/api/resources/pods/client/Client.ts">update</a>(podId, { ...params }) -> AgentMailer.UpdatePodsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.pods.update("podId", {
    name: "name"
});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**podId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.PodUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `PodsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## domains
<details><summary><code>client.domains.<a href="/src/api/resources/domains/client/Client.ts">list</a>() -> AgentMailer.ListDomainsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.domains.list();

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `DomainsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/src/api/resources/domains/client/Client.ts">create</a>({ ...params }) -> AgentMailer.CreateDomainsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.domains.create({
    domain: "domain"
});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `AgentMailer.DomainCreate` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `DomainsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/src/api/resources/domains/client/Client.ts">get</a>(domainId) -> AgentMailer.GetDomainsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.domains.get("domainId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**domainId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `DomainsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/src/api/resources/domains/client/Client.ts">delete</a>(domainId) -> void</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.domains.delete("domainId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**domainId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `DomainsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/src/api/resources/domains/client/Client.ts">verify</a>(domainId) -> AgentMailer.VerifyDomainsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.domains.verify("domainId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**domainId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `DomainsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## webhooks
<details><summary><code>client.webhooks.<a href="/src/api/resources/webhooks/client/Client.ts">list</a>() -> AgentMailer.ListWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.webhooks.list();

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `WebhooksClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/src/api/resources/webhooks/client/Client.ts">create</a>({ ...params }) -> AgentMailer.CreateWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.webhooks.create({
    url: "url"
});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `AgentMailer.WebhookCreate` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `WebhooksClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/src/api/resources/webhooks/client/Client.ts">get</a>(webhookId) -> AgentMailer.GetWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.webhooks.get("webhookId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `WebhooksClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/src/api/resources/webhooks/client/Client.ts">delete</a>(webhookId) -> void</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.webhooks.delete("webhookId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `WebhooksClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/src/api/resources/webhooks/client/Client.ts">update</a>(webhookId, { ...params }) -> AgentMailer.UpdateWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.webhooks.update("webhookId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.WebhookUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `WebhooksClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/src/api/resources/webhooks/client/Client.ts">rotateSecret</a>(webhookId) -> AgentMailer.RotateSecretWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.webhooks.rotateSecret("webhookId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `WebhooksClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## labels
<details><summary><code>client.labels.<a href="/src/api/resources/labels/client/Client.ts">list</a>({ ...params }) -> AgentMailer.ListLabelsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.labels.list();

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `AgentMailer.ListLabelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `LabelsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/src/api/resources/labels/client/Client.ts">create</a>({ ...params }) -> AgentMailer.CreateLabelsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.labels.create({
    podId: "podId",
    name: "name"
});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `AgentMailer.LabelCreate` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `LabelsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/src/api/resources/labels/client/Client.ts">delete</a>(labelId) -> void</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.labels.delete("labelId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**labelId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `LabelsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/src/api/resources/labels/client/Client.ts">updateMessage</a>(messageId, { ...params }) -> AgentMailer.UpdateMessageLabelsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.labels.updateMessage("messageId", {});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**messageId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.LabelMutation` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `LabelsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/src/api/resources/labels/client/Client.ts">updateThread</a>(threadId, { ...params }) -> AgentMailer.UpdateThreadLabelsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.labels.updateThread("threadId", {});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**threadId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.LabelMutation` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `LabelsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## lists
<details><summary><code>client.lists.<a href="/src/api/resources/lists/client/Client.ts">list</a>({ ...params }) -> AgentMailer.ListListsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.lists.list();

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `AgentMailer.ListListsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `ListsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/src/api/resources/lists/client/Client.ts">create</a>({ ...params }) -> AgentMailer.CreateListsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.lists.create({
    podId: "podId",
    name: "name",
    kind: "allow"
});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `AgentMailer.ListCreate` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `ListsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/src/api/resources/lists/client/Client.ts">delete</a>(listId) -> void</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.lists.delete("listId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**listId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `ListsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/src/api/resources/lists/client/Client.ts">addEntry</a>(listId, { ...params }) -> AgentMailer.AddEntryListsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.lists.addEntry("listId", {
    addressPattern: "addressPattern"
});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**listId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.ListEntry` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `ListsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/src/api/resources/lists/client/Client.ts">removeEntry</a>(listId, { ...params }) -> AgentMailer.RemoveEntryListsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.lists.removeEntry("listId");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**listId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.RemoveEntryListsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `ListsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## events
<details><summary><code>client.events.<a href="/src/api/resources/events/client/Client.ts">createTicket</a>({ ...params }) -> AgentMailer.CreateTicketEventsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.events.createTicket({
    podId: "podId"
});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `AgentMailer.CreateTicketEventsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `EventsClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## billing
<details><summary><code>client.billing.<a href="/src/api/resources/billing/client/Client.ts">get</a>() -> AgentMailer.GetBillingResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.billing.get();

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `BillingClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.billing.<a href="/src/api/resources/billing/client/Client.ts">createCheckout</a>({ ...params }) -> AgentMailer.CreateCheckoutBillingResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.billing.createCheckout();

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `AgentMailer.BillingSelection` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `BillingClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.billing.<a href="/src/api/resources/billing/client/Client.ts">createPortal</a>() -> AgentMailer.CreatePortalBillingResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.billing.createPortal();

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `BillingClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## a2a
<details><summary><code>client.a2A.<a href="/src/api/resources/a2A/client/Client.ts">sendTask</a>(handle, { ...params }) -> Record&lt;string, unknown&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.a2A.sendTask("handle", {
    jsonrpc: "2.0",
    method: "method"
});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**handle:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.A2AJsonRpcRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `A2AClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2A.<a href="/src/api/resources/a2A/client/Client.ts">getAgentCard</a>(handle) -> AgentMailer.A2AAgentCard</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.a2A.getAgentCard("handle");

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**handle:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `A2AClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2A.<a href="/src/api/resources/a2A/client/Client.ts">updateTask</a>(taskId, { ...params }) -> AgentMailer.UpdateTaskA2AResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.a2A.updateTask("taskId", {
    state: "TASK_STATE_SUBMITTED"
});

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**taskId:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer.A2ATaskUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `A2AClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2A.<a href="/src/api/resources/a2A/client/Client.ts">updateIdentity</a>({ ...params }) -> Record&lt;string, unknown&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```typescript
await client.a2A.updateIdentity();

```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `AgentMailer.A2AIdentitySettings` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `A2AClient.RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

