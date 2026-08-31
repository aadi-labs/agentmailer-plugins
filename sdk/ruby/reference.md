# Reference
## agent
<details><summary><code>client.agent.<a href="/lib/AgentMailer/agent/client.rb">bootstrap</a>(request) -> AgentMailer::Types::BootstrapResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.agent.bootstrap
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

**requested_local_part:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**pod_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Agent::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.agent.<a href="/lib/AgentMailer/agent/client.rb">sign_up</a>(request) -> AgentMailer::Agent::Types::SignUpAgentResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.agent.sign_up(
  human_email: "human_email",
  username: "username"
)
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

**human_email:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**username:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Agent::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## inboxes
<details><summary><code>client.inboxes.<a href="/lib/AgentMailer/inboxes/client.rb">list</a>() -> AgentMailer::Inboxes::Types::ListInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inboxes.list
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

**limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Inboxes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/lib/AgentMailer/inboxes/client.rb">create</a>(request) -> AgentMailer::Inboxes::Types::CreateInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inboxes.create
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

**username:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**pod_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**domain_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**display_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, AgentMailer::Inboxes::Types::InboxCreateMetadataValue]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Inboxes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/lib/AgentMailer/inboxes/client.rb">get</a>(inbox_id:) -> AgentMailer::Inboxes::Types::GetInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inboxes.get(inbox_id: "inboxId")
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Inboxes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/lib/AgentMailer/inboxes/client.rb">delete</a>(inbox_id:) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inboxes.delete(inbox_id: "inboxId")
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Inboxes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/lib/AgentMailer/inboxes/client.rb">update</a>(inbox_id:, request) -> AgentMailer::Inboxes::Types::UpdateInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inboxes.update(inbox_id: "inboxId")
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**display_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, AgentMailer::Inboxes::Types::InboxUpdateMetadataValue]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Inboxes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/lib/AgentMailer/inboxes/client.rb">issue_credentials</a>(inbox_id:) -> AgentMailer::Inboxes::Types::IssueCredentialsInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inboxes.issue_credentials(inbox_id: "inboxId")
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Inboxes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## messages
<details><summary><code>client.messages.<a href="/lib/AgentMailer/messages/client.rb">list</a>(inbox_id:) -> AgentMailer::Messages::Types::ListMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.list(inbox_id: "inboxId")
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**thread_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**label:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**query:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Messages::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/lib/AgentMailer/messages/client.rb">send_</a>(inbox_id:, request) -> AgentMailer::Messages::Types::SendMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.send_(
  inbox_id: "inboxId",
  to: ["to"]
)
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer::Types::MessageCompose` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Messages::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/lib/AgentMailer/messages/client.rb">get</a>(inbox_id:, message_id:) -> AgentMailer::Messages::Types::GetMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.get(
  inbox_id: "inboxId",
  message_id: "messageId"
)
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**message_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Messages::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/lib/AgentMailer/messages/client.rb">delete</a>(inbox_id:, message_id:) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.delete(
  inbox_id: "inboxId",
  message_id: "messageId"
)
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**message_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Messages::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/lib/AgentMailer/messages/client.rb">reply</a>(inbox_id:, message_id:, request) -> AgentMailer::Messages::Types::ReplyMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.reply(
  inbox_id: "inboxId",
  message_id: "messageId"
)
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**message_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer::Types::ReplyCompose` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Messages::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/lib/AgentMailer/messages/client.rb">reply_all</a>(inbox_id:, message_id:, request) -> AgentMailer::Messages::Types::ReplyAllMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.reply_all(
  inbox_id: "inboxId",
  message_id: "messageId"
)
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**message_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer::Types::ReplyCompose` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Messages::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/lib/AgentMailer/messages/client.rb">forward</a>(inbox_id:, message_id:, request) -> AgentMailer::Messages::Types::ForwardMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.forward(
  inbox_id: "inboxId",
  message_id: "messageId",
  to: ["to"]
)
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**message_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer::Types::MessageCompose` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Messages::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## threads
<details><summary><code>client.threads.<a href="/lib/AgentMailer/threads/client.rb">list</a>(inbox_id:) -> AgentMailer::Threads::Types::ListThreadsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.threads.list(inbox_id: "inboxId")
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**label:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**query:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Threads::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.threads.<a href="/lib/AgentMailer/threads/client.rb">get</a>(inbox_id:, thread_id:) -> AgentMailer::Threads::Types::GetThreadsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.threads.get(
  inbox_id: "inboxId",
  thread_id: "threadId"
)
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**thread_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Threads::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## drafts
<details><summary><code>client.drafts.<a href="/lib/AgentMailer/drafts/client.rb">list</a>(inbox_id:) -> AgentMailer::Drafts::Types::ListDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.drafts.list(inbox_id: "inboxId")
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Drafts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/lib/AgentMailer/drafts/client.rb">create</a>(inbox_id:, request) -> AgentMailer::Drafts::Types::CreateDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.drafts.create(inbox_id: "inboxId")
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**to:** `Internal::Types::Array[AgentMailer::Drafts::Types::DraftCreateToItem]` 
    
</dd>
</dl>

<dl>
<dd>

**cc:** `Internal::Types::Array[AgentMailer::Drafts::Types::DraftCreateCcItem]` 
    
</dd>
</dl>

<dl>
<dd>

**bcc:** `Internal::Types::Array[AgentMailer::Drafts::Types::DraftCreateBccItem]` 
    
</dd>
</dl>

<dl>
<dd>

**reply_to:** `Internal::Types::Array[AgentMailer::Drafts::Types::DraftCreateReplyToItem]` 
    
</dd>
</dl>

<dl>
<dd>

**subject:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**text:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**html:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**headers:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**attachments:** `Internal::Types::Array[AgentMailer::Drafts::Types::DraftCreateAttachmentsItem]` 
    
</dd>
</dl>

<dl>
<dd>

**reply_to_message_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**forward_message_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**send_at:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Drafts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/lib/AgentMailer/drafts/client.rb">get</a>(inbox_id:, draft_id:) -> AgentMailer::Drafts::Types::GetDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.drafts.get(
  inbox_id: "inboxId",
  draft_id: "draftId"
)
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**draft_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Drafts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/lib/AgentMailer/drafts/client.rb">delete</a>(inbox_id:, draft_id:) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.drafts.delete(
  inbox_id: "inboxId",
  draft_id: "draftId"
)
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**draft_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Drafts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/lib/AgentMailer/drafts/client.rb">update</a>(inbox_id:, draft_id:, request) -> AgentMailer::Drafts::Types::UpdateDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.drafts.update(
  inbox_id: "inboxId",
  draft_id: "draftId"
)
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**draft_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**to:** `Internal::Types::Array[AgentMailer::Drafts::Types::DraftUpdateToItem]` 
    
</dd>
</dl>

<dl>
<dd>

**cc:** `Internal::Types::Array[AgentMailer::Drafts::Types::DraftUpdateCcItem]` 
    
</dd>
</dl>

<dl>
<dd>

**bcc:** `Internal::Types::Array[AgentMailer::Drafts::Types::DraftUpdateBccItem]` 
    
</dd>
</dl>

<dl>
<dd>

**reply_to:** `Internal::Types::Array[AgentMailer::Drafts::Types::DraftUpdateReplyToItem]` 
    
</dd>
</dl>

<dl>
<dd>

**subject:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**text:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**html:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**headers:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**attachments:** `Internal::Types::Array[AgentMailer::Drafts::Types::DraftUpdateAttachmentsItem]` 
    
</dd>
</dl>

<dl>
<dd>

**reply_to_message_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**forward_message_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**send_at:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Drafts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/lib/AgentMailer/drafts/client.rb">send_</a>(inbox_id:, draft_id:) -> AgentMailer::Drafts::Types::SendDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.drafts.send_(
  inbox_id: "inboxId",
  draft_id: "draftId"
)
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**draft_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Drafts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## attachments
<details><summary><code>client.attachments.<a href="/lib/AgentMailer/attachments/client.rb">upload</a>(inbox_id:, request) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attachments.upload(
  inbox_id: "inboxId",
  filename: "filename",
  content_type: "contentType",
  size: 1,
  checksum_sha256: "checksumSha256"
)
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**filename:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**content_type:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**size:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**checksum_sha256:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Attachments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attachments.<a href="/lib/AgentMailer/attachments/client.rb">complete</a>(inbox_id:, attachment_id:) -> AgentMailer::Attachments::Types::CompleteAttachmentsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attachments.complete(
  inbox_id: "inboxId",
  attachment_id: "attachmentId"
)
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**attachment_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Attachments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attachments.<a href="/lib/AgentMailer/attachments/client.rb">download</a>(inbox_id:, attachment_id:) -> AgentMailer::Attachments::Types::DownloadAttachmentsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attachments.download(
  inbox_id: "inboxId",
  attachment_id: "attachmentId"
)
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

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**attachment_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Attachments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## pods
<details><summary><code>client.pods.<a href="/lib/AgentMailer/pods/client.rb">list</a>() -> AgentMailer::Pods::Types::ListPodsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pods.list
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

**request_options:** `AgentMailer::Pods::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/lib/AgentMailer/pods/client.rb">create</a>(request) -> AgentMailer::Pods::Types::CreatePodsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pods.create(name: "name")
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

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Pods::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/lib/AgentMailer/pods/client.rb">get</a>(pod_id:) -> AgentMailer::Pods::Types::GetPodsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pods.get(pod_id: "podId")
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

**pod_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Pods::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/lib/AgentMailer/pods/client.rb">delete</a>(pod_id:) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pods.delete(pod_id: "podId")
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

**pod_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Pods::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/lib/AgentMailer/pods/client.rb">update</a>(pod_id:, request) -> AgentMailer::Pods::Types::UpdatePodsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pods.update(
  pod_id: "podId",
  name: "name"
)
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

**pod_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Pods::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## domains
<details><summary><code>client.domains.<a href="/lib/AgentMailer/domains/client.rb">list</a>() -> AgentMailer::Domains::Types::ListDomainsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.domains.list
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

**request_options:** `AgentMailer::Domains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/lib/AgentMailer/domains/client.rb">create</a>(request) -> AgentMailer::Domains::Types::CreateDomainsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.domains.create(domain: "domain")
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

**domain:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**pod_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Domains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/lib/AgentMailer/domains/client.rb">get</a>(domain_id:) -> AgentMailer::Domains::Types::GetDomainsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.domains.get(domain_id: "domainId")
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

**domain_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Domains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/lib/AgentMailer/domains/client.rb">delete</a>(domain_id:) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.domains.delete(domain_id: "domainId")
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

**domain_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Domains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/lib/AgentMailer/domains/client.rb">verify</a>(domain_id:) -> AgentMailer::Domains::Types::VerifyDomainsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.domains.verify(domain_id: "domainId")
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

**domain_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Domains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## webhooks
<details><summary><code>client.webhooks.<a href="/lib/AgentMailer/webhooks/client.rb">list</a>() -> AgentMailer::Webhooks::Types::ListWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.list
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

**request_options:** `AgentMailer::Webhooks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/AgentMailer/webhooks/client.rb">create</a>(request) -> AgentMailer::Webhooks::Types::CreateWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.create(url: "url")
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

**url:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**pod_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**inbox_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**event_types:** `Internal::Types::Array[AgentMailer::Webhooks::Types::WebhookCreateEventTypesItem]` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Webhooks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/AgentMailer/webhooks/client.rb">get</a>(webhook_id:) -> AgentMailer::Webhooks::Types::GetWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.get(webhook_id: "webhookId")
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

**webhook_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Webhooks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/AgentMailer/webhooks/client.rb">delete</a>(webhook_id:) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.delete(webhook_id: "webhookId")
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

**webhook_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Webhooks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/AgentMailer/webhooks/client.rb">update</a>(webhook_id:, request) -> AgentMailer::Webhooks::Types::UpdateWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.update(webhook_id: "webhookId")
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

**webhook_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**url:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**event_types:** `Internal::Types::Array[AgentMailer::Webhooks::Types::WebhookUpdateEventTypesItem]` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Webhooks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/AgentMailer/webhooks/client.rb">rotate_secret</a>(webhook_id:) -> AgentMailer::Webhooks::Types::RotateSecretWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.rotate_secret(webhook_id: "webhookId")
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

**webhook_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Webhooks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## labels
<details><summary><code>client.labels.<a href="/lib/AgentMailer/labels/client.rb">list</a>() -> AgentMailer::Labels::Types::ListLabelsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labels.list
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

**pod_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Labels::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/lib/AgentMailer/labels/client.rb">create</a>(request) -> AgentMailer::Labels::Types::CreateLabelsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labels.create(
  pod_id: "podId",
  name: "name"
)
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

**pod_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**color:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Labels::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/lib/AgentMailer/labels/client.rb">delete</a>(label_id:) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labels.delete(label_id: "labelId")
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

**label_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Labels::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/lib/AgentMailer/labels/client.rb">update_message</a>(message_id:, request) -> AgentMailer::Labels::Types::UpdateMessageLabelsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labels.update_message(message_id: "messageId")
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

**message_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer::Types::LabelMutation` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Labels::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/lib/AgentMailer/labels/client.rb">update_thread</a>(thread_id:, request) -> AgentMailer::Labels::Types::UpdateThreadLabelsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labels.update_thread(thread_id: "threadId")
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

**thread_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `AgentMailer::Types::LabelMutation` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Labels::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## lists
<details><summary><code>client.lists.<a href="/lib/AgentMailer/lists/client.rb">list</a>() -> AgentMailer::Lists::Types::ListListsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.lists.list
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

**pod_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Lists::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/lib/AgentMailer/lists/client.rb">create</a>(request) -> AgentMailer::Lists::Types::CreateListsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.lists.create(
  pod_id: "podId",
  name: "name",
  kind: "allow"
)
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

**pod_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**kind:** `AgentMailer::Lists::Types::ListCreateKind` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Lists::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/lib/AgentMailer/lists/client.rb">delete</a>(list_id:) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.lists.delete(list_id: "listId")
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

**list_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Lists::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/lib/AgentMailer/lists/client.rb">add_entry</a>(list_id:, request) -> AgentMailer::Lists::Types::AddEntryListsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.lists.add_entry(
  list_id: "listId",
  address_pattern: "addressPattern"
)
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

**list_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**address_pattern:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**note:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Lists::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/lib/AgentMailer/lists/client.rb">remove_entry</a>(list_id:) -> AgentMailer::Lists::Types::RemoveEntryListsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.lists.remove_entry(list_id: "listId")
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

**list_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**address_pattern:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Lists::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## events
<details><summary><code>client.events.<a href="/lib/AgentMailer/events/client.rb">create_ticket</a>(request) -> AgentMailer::Events::Types::CreateTicketEventsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.events.create_ticket(pod_id: "podId")
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

**pod_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Events::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## billing
<details><summary><code>client.billing.<a href="/lib/AgentMailer/billing/client.rb">get</a>() -> AgentMailer::Billing::Types::GetBillingResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.billing.get
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

**request_options:** `AgentMailer::Billing::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.billing.<a href="/lib/AgentMailer/billing/client.rb">create_checkout</a>(request) -> AgentMailer::Billing::Types::CreateCheckoutBillingResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.billing.create_checkout
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

**inboxes:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**monthly_messages:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**custom_domains:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**interval:** `AgentMailer::Billing::Types::BillingSelectionInterval` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::Billing::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.billing.<a href="/lib/AgentMailer/billing/client.rb">create_portal</a>() -> AgentMailer::Billing::Types::CreatePortalBillingResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.billing.create_portal
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

**request_options:** `AgentMailer::Billing::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## a2a
<details><summary><code>client.a2a.<a href="/lib/AgentMailer/a2a/client.rb">send_task</a>(handle:, request) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.a2a.send_task(
  handle: "handle",
  jsonrpc: "2.0",
  method_: "method"
)
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

**handle:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**jsonrpc:** `AgentMailer::A2A::Types::A2AJsonRpcRequestJsonrpc` 
    
</dd>
</dl>

<dl>
<dd>

**id:** `AgentMailer::A2A::Types::A2AJsonRpcRequestId` 
    
</dd>
</dl>

<dl>
<dd>

**method_:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**params:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::A2A::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2a.<a href="/lib/AgentMailer/a2a/client.rb">get_agent_card</a>(handle:) -> AgentMailer::Types::A2AAgentCard</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.a2a.get_agent_card(handle: "handle")
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

**handle:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::A2A::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2a.<a href="/lib/AgentMailer/a2a/client.rb">update_task</a>(task_id:, request) -> AgentMailer::A2A::Types::UpdateTaskA2AResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.a2a.update_task(
  task_id: "taskId",
  state: "TASK_STATE_SUBMITTED"
)
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

**task_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**state:** `AgentMailer::A2A::Types::A2ATaskUpdateState` 
    
</dd>
</dl>

<dl>
<dd>

**message:** `AgentMailer::A2A::Types::A2ATaskUpdateMessage` 
    
</dd>
</dl>

<dl>
<dd>

**artifacts:** `Internal::Types::Array[AgentMailer::A2A::Types::A2ATaskUpdateArtifactsItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::A2A::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2a.<a href="/lib/AgentMailer/a2a/client.rb">update_identity</a>(request) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.a2a.update_identity
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

**publicly_discoverable:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**admission_mode:** `AgentMailer::A2A::Types::A2AIdentitySettingsAdmissionMode` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**skills:** `Internal::Types::Array[AgentMailer::A2A::Types::A2AIdentitySettingsSkillsItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `AgentMailer::A2A::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

