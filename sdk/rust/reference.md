# Reference
## agent
<details><summary><code>client.agent.<a href="/src/api/resources/agent/client.rs">bootstrap</a>(request: BootstrapRequest) -> Result&lt;BootstrapResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .agent
        .bootstrap(
            &BootstrapRequest {
                ..Default::default()
            },
            None,
        )
        .await;
}
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

**requested_local_part:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**pod_name:** `Option<String>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.agent.<a href="/src/api/resources/agent/client.rs">sign_up</a>(request: SignUpAgentRequest) -> Result&lt;SignUpAgentResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .agent
        .sign_up(
            &SignUpAgentRequest {
                human_email: "human_email".to_string(),
                username: "username".to_string(),
            },
            None,
        )
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

## inboxes
<details><summary><code>client.inboxes.<a href="/src/api/resources/inboxes/client.rs">list</a>(limit: Option&lt;Option&lt;i64&gt;&gt;, page_token: Option&lt;Option&lt;String&gt;&gt;) -> Result&lt;ListInboxesResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .inboxes
        .list(
            &InboxesListQueryRequest {
                ..Default::default()
            },
            None,
        )
        .await;
}
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

**limit:** `Option<i64>` 
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `Option<String>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/src/api/resources/inboxes/client.rs">create</a>(request: InboxCreate) -> Result&lt;CreateInboxesResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .inboxes
        .create(
            &InboxCreate {
                ..Default::default()
            },
            None,
        )
        .await;
}
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

**username:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**pod_id:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**domain_id:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**display_name:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Option<std::collections::HashMap<String, InboxCreateMetadataValue>>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/src/api/resources/inboxes/client.rs">get</a>(inbox_id: String) -> Result&lt;GetInboxesResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.inboxes.get(&"inboxId".to_string(), None).await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/src/api/resources/inboxes/client.rs">delete</a>(inbox_id: String) -> Result&lt;(), ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.inboxes.delete(&"inboxId".to_string(), None).await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/src/api/resources/inboxes/client.rs">update</a>(inbox_id: String, request: InboxUpdate) -> Result&lt;UpdateInboxesResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .inboxes
        .update(
            &"inboxId".to_string(),
            &InboxUpdate {
                ..Default::default()
            },
            None,
        )
        .await;
}
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

**display_name:** `Option<Option<String>>` 
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `Option<Option<String>>` 
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Option<Option<std::collections::HashMap<String, Option<InboxUpdateMetadataValue>>>>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/src/api/resources/inboxes/client.rs">issue_credentials</a>(inbox_id: String) -> Result&lt;IssueCredentialsInboxesResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .inboxes
        .issue_credentials(&"inboxId".to_string(), None)
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

## messages
<details><summary><code>client.messages.<a href="/src/api/resources/messages/client.rs">list</a>(inbox_id: String, limit: Option&lt;Option&lt;i64&gt;&gt;, page_token: Option&lt;Option&lt;String&gt;&gt;, thread_id: Option&lt;Option&lt;String&gt;&gt;, label: Option&lt;Option&lt;String&gt;&gt;, query: Option&lt;Option&lt;String&gt;&gt;, before: Option&lt;Option&lt;String&gt;&gt;, after: Option&lt;Option&lt;String&gt;&gt;) -> Result&lt;ListMessagesResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .messages
        .list(
            &"inboxId".to_string(),
            &MessagesListQueryRequest {
                ..Default::default()
            },
            None,
        )
        .await;
}
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

**limit:** `Option<i64>` 
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**thread_id:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**label:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**query:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**before:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**after:** `Option<String>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/src/api/resources/messages/client.rs">send</a>(inbox_id: String, request: MessageCompose) -> Result&lt;SendMessagesResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .messages
        .send(
            &"inboxId".to_string(),
            &MessageCompose {
                to: vec![MessageComposeToItem::String("to".to_string())],
                ..Default::default()
            },
            None,
        )
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/src/api/resources/messages/client.rs">get</a>(inbox_id: String, message_id: String) -> Result&lt;GetMessagesResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .messages
        .get(&"inboxId".to_string(), &"messageId".to_string(), None)
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/src/api/resources/messages/client.rs">delete</a>(inbox_id: String, message_id: String) -> Result&lt;(), ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .messages
        .delete(&"inboxId".to_string(), &"messageId".to_string(), None)
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/src/api/resources/messages/client.rs">reply</a>(inbox_id: String, message_id: String, request: ReplyCompose) -> Result&lt;ReplyMessagesResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .messages
        .reply(
            &"inboxId".to_string(),
            &"messageId".to_string(),
            &ReplyCompose {
                ..Default::default()
            },
            None,
        )
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/src/api/resources/messages/client.rs">reply_all</a>(inbox_id: String, message_id: String, request: ReplyCompose) -> Result&lt;ReplyAllMessagesResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .messages
        .reply_all(
            &"inboxId".to_string(),
            &"messageId".to_string(),
            &ReplyCompose {
                ..Default::default()
            },
            None,
        )
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/src/api/resources/messages/client.rs">forward</a>(inbox_id: String, message_id: String, request: MessageCompose) -> Result&lt;ForwardMessagesResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .messages
        .forward(
            &"inboxId".to_string(),
            &"messageId".to_string(),
            &MessageCompose {
                to: vec![MessageComposeToItem::String("to".to_string())],
                ..Default::default()
            },
            None,
        )
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

## threads
<details><summary><code>client.threads.<a href="/src/api/resources/threads/client.rs">list</a>(inbox_id: String, limit: Option&lt;Option&lt;i64&gt;&gt;, page_token: Option&lt;Option&lt;String&gt;&gt;, label: Option&lt;Option&lt;String&gt;&gt;, query: Option&lt;Option&lt;String&gt;&gt;, before: Option&lt;Option&lt;String&gt;&gt;, after: Option&lt;Option&lt;String&gt;&gt;) -> Result&lt;ListThreadsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .threads
        .list(
            &"inboxId".to_string(),
            &ThreadsListQueryRequest {
                ..Default::default()
            },
            None,
        )
        .await;
}
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

**limit:** `Option<i64>` 
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**label:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**query:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**before:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**after:** `Option<String>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.threads.<a href="/src/api/resources/threads/client.rs">get</a>(inbox_id: String, thread_id: String) -> Result&lt;GetThreadsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .threads
        .get(&"inboxId".to_string(), &"threadId".to_string(), None)
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

## drafts
<details><summary><code>client.drafts.<a href="/src/api/resources/drafts/client.rs">list</a>(inbox_id: String) -> Result&lt;ListDraftsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.drafts.list(&"inboxId".to_string(), None).await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/src/api/resources/drafts/client.rs">create</a>(inbox_id: String, request: DraftCreate) -> Result&lt;CreateDraftsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .drafts
        .create(
            &"inboxId".to_string(),
            &DraftCreate {
                ..Default::default()
            },
            None,
        )
        .await;
}
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

**to:** `Option<Vec<DraftCreateToItem>>` 
    
</dd>
</dl>

<dl>
<dd>

**cc:** `Option<Vec<DraftCreateCcItem>>` 
    
</dd>
</dl>

<dl>
<dd>

**bcc:** `Option<Vec<DraftCreateBccItem>>` 
    
</dd>
</dl>

<dl>
<dd>

**reply_to:** `Option<Vec<DraftCreateReplyToItem>>` 
    
</dd>
</dl>

<dl>
<dd>

**subject:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**text:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**html:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**headers:** `Option<std::collections::HashMap<String, String>>` 
    
</dd>
</dl>

<dl>
<dd>

**attachments:** `Option<Vec<DraftCreateAttachmentsItem>>` 
    
</dd>
</dl>

<dl>
<dd>

**reply_to_message_id:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**forward_message_id:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**send_at:** `Option<Option<String>>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/src/api/resources/drafts/client.rs">get</a>(inbox_id: String, draft_id: String) -> Result&lt;GetDraftsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .drafts
        .get(&"inboxId".to_string(), &"draftId".to_string(), None)
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/src/api/resources/drafts/client.rs">delete</a>(inbox_id: String, draft_id: String) -> Result&lt;(), ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .drafts
        .delete(&"inboxId".to_string(), &"draftId".to_string(), None)
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/src/api/resources/drafts/client.rs">update</a>(inbox_id: String, draft_id: String, request: DraftUpdate) -> Result&lt;UpdateDraftsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .drafts
        .update(
            &"inboxId".to_string(),
            &"draftId".to_string(),
            &DraftUpdate {
                ..Default::default()
            },
            None,
        )
        .await;
}
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

**to:** `Option<Vec<DraftUpdateToItem>>` 
    
</dd>
</dl>

<dl>
<dd>

**cc:** `Option<Vec<DraftUpdateCcItem>>` 
    
</dd>
</dl>

<dl>
<dd>

**bcc:** `Option<Vec<DraftUpdateBccItem>>` 
    
</dd>
</dl>

<dl>
<dd>

**reply_to:** `Option<Vec<DraftUpdateReplyToItem>>` 
    
</dd>
</dl>

<dl>
<dd>

**subject:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**text:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**html:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**headers:** `Option<std::collections::HashMap<String, String>>` 
    
</dd>
</dl>

<dl>
<dd>

**attachments:** `Option<Vec<DraftUpdateAttachmentsItem>>` 
    
</dd>
</dl>

<dl>
<dd>

**reply_to_message_id:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**forward_message_id:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**send_at:** `Option<Option<String>>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/src/api/resources/drafts/client.rs">send</a>(inbox_id: String, draft_id: String) -> Result&lt;SendDraftsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .drafts
        .send(&"inboxId".to_string(), &"draftId".to_string(), None)
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

## attachments
<details><summary><code>client.attachments.<a href="/src/api/resources/attachments/client.rs">upload</a>(inbox_id: String, request: AttachmentUploadCreate) -> Result&lt;std::collections::HashMap&lt;String, serde_json::Value&gt;, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .attachments
        .upload(
            &"inboxId".to_string(),
            &AttachmentUploadCreate {
                filename: "filename".to_string(),
                content_type: "contentType".to_string(),
                size: 1,
                checksum_sha256: "checksumSha256".to_string(),
            },
            None,
        )
        .await;
}
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

**size:** `i64` 
    
</dd>
</dl>

<dl>
<dd>

**checksum_sha256:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attachments.<a href="/src/api/resources/attachments/client.rs">complete</a>(inbox_id: String, attachment_id: String) -> Result&lt;CompleteAttachmentsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .attachments
        .complete(&"inboxId".to_string(), &"attachmentId".to_string(), None)
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attachments.<a href="/src/api/resources/attachments/client.rs">download</a>(inbox_id: String, attachment_id: String) -> Result&lt;DownloadAttachmentsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .attachments
        .download(&"inboxId".to_string(), &"attachmentId".to_string(), None)
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

## pods
<details><summary><code>client.pods.<a href="/src/api/resources/pods/client.rs">list</a>() -> Result&lt;ListPodsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.pods.list(None).await;
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/src/api/resources/pods/client.rs">create</a>(request: PodCreate) -> Result&lt;CreatePodsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .pods
        .create(
            &PodCreate {
                name: "name".to_string(),
            },
            None,
        )
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/src/api/resources/pods/client.rs">get</a>(pod_id: String) -> Result&lt;GetPodsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.pods.get(&"podId".to_string(), None).await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/src/api/resources/pods/client.rs">delete</a>(pod_id: String) -> Result&lt;(), ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.pods.delete(&"podId".to_string(), None).await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/src/api/resources/pods/client.rs">update</a>(pod_id: String, request: PodUpdate) -> Result&lt;UpdatePodsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .pods
        .update(
            &"podId".to_string(),
            &PodUpdate {
                name: "name".to_string(),
            },
            None,
        )
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

## domains
<details><summary><code>client.domains.<a href="/src/api/resources/domains/client.rs">list</a>() -> Result&lt;ListDomainsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.domains.list(None).await;
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/src/api/resources/domains/client.rs">create</a>(request: DomainCreate) -> Result&lt;CreateDomainsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .domains
        .create(
            &DomainCreate {
                domain: "domain".to_string(),
                pod_id: None,
            },
            None,
        )
        .await;
}
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

**pod_id:** `Option<String>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/src/api/resources/domains/client.rs">get</a>(domain_id: String) -> Result&lt;GetDomainsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.domains.get(&"domainId".to_string(), None).await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/src/api/resources/domains/client.rs">delete</a>(domain_id: String) -> Result&lt;(), ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.domains.delete(&"domainId".to_string(), None).await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/src/api/resources/domains/client.rs">verify</a>(domain_id: String) -> Result&lt;VerifyDomainsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.domains.verify(&"domainId".to_string(), None).await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

## webhooks
<details><summary><code>client.webhooks.<a href="/src/api/resources/webhooks/client.rs">list</a>() -> Result&lt;ListWebhooksResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.webhooks.list(None).await;
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/src/api/resources/webhooks/client.rs">create</a>(request: WebhookCreate) -> Result&lt;CreateWebhooksResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .webhooks
        .create(
            &WebhookCreate {
                url: "url".to_string(),
                pod_id: None,
                inbox_id: None,
                event_types: None,
                description: None,
            },
            None,
        )
        .await;
}
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

**pod_id:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**inbox_id:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**event_types:** `Option<Vec<WebhookCreateEventTypesItem>>` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `Option<String>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/src/api/resources/webhooks/client.rs">get</a>(webhook_id: String) -> Result&lt;GetWebhooksResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.webhooks.get(&"webhookId".to_string(), None).await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/src/api/resources/webhooks/client.rs">delete</a>(webhook_id: String) -> Result&lt;(), ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.webhooks.delete(&"webhookId".to_string(), None).await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/src/api/resources/webhooks/client.rs">update</a>(webhook_id: String, request: WebhookUpdate) -> Result&lt;UpdateWebhooksResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .webhooks
        .update(
            &"webhookId".to_string(),
            &WebhookUpdate {
                ..Default::default()
            },
            None,
        )
        .await;
}
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

**url:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**event_types:** `Option<Vec<WebhookUpdateEventTypesItem>>` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Option<bool>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/src/api/resources/webhooks/client.rs">rotate_secret</a>(webhook_id: String) -> Result&lt;RotateSecretWebhooksResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .webhooks
        .rotate_secret(&"webhookId".to_string(), None)
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

## labels
<details><summary><code>client.labels.<a href="/src/api/resources/labels/client.rs">list</a>(pod_id: Option&lt;Option&lt;String&gt;&gt;) -> Result&lt;ListLabelsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .labels
        .list(
            &LabelsListQueryRequest {
                ..Default::default()
            },
            None,
        )
        .await;
}
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

**pod_id:** `Option<String>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/src/api/resources/labels/client.rs">create</a>(request: LabelCreate) -> Result&lt;CreateLabelsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .labels
        .create(
            &LabelCreate {
                pod_id: "podId".to_string(),
                name: "name".to_string(),
                color: None,
            },
            None,
        )
        .await;
}
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

**color:** `Option<String>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/src/api/resources/labels/client.rs">delete</a>(label_id: String) -> Result&lt;(), ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.labels.delete(&"labelId".to_string(), None).await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/src/api/resources/labels/client.rs">update_message</a>(message_id: String, request: LabelMutation) -> Result&lt;UpdateMessageLabelsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .labels
        .update_message(
            &"messageId".to_string(),
            &LabelMutation {
                ..Default::default()
            },
            None,
        )
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/src/api/resources/labels/client.rs">update_thread</a>(thread_id: String, request: LabelMutation) -> Result&lt;UpdateThreadLabelsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .labels
        .update_thread(
            &"threadId".to_string(),
            &LabelMutation {
                ..Default::default()
            },
            None,
        )
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

## lists
<details><summary><code>client.lists.<a href="/src/api/resources/lists/client.rs">list</a>(pod_id: Option&lt;Option&lt;String&gt;&gt;) -> Result&lt;ListListsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .lists
        .list(
            &ListsListQueryRequest {
                ..Default::default()
            },
            None,
        )
        .await;
}
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

**pod_id:** `Option<String>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/src/api/resources/lists/client.rs">create</a>(request: ListCreate) -> Result&lt;CreateListsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .lists
        .create(
            &ListCreate {
                pod_id: "podId".to_string(),
                name: "name".to_string(),
                kind: ListCreateKind::Allow,
            },
            None,
        )
        .await;
}
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

**kind:** `ListCreateKind` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/src/api/resources/lists/client.rs">delete</a>(list_id: String) -> Result&lt;(), ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.lists.delete(&"listId".to_string(), None).await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/src/api/resources/lists/client.rs">add_entry</a>(list_id: String, request: ListEntry) -> Result&lt;AddEntryListsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .lists
        .add_entry(
            &"listId".to_string(),
            &ListEntry {
                address_pattern: "addressPattern".to_string(),
                note: None,
            },
            None,
        )
        .await;
}
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

**note:** `Option<String>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/src/api/resources/lists/client.rs">remove_entry</a>(list_id: String, address_pattern: Option&lt;Option&lt;String&gt;&gt;) -> Result&lt;RemoveEntryListsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .lists
        .remove_entry(
            &"listId".to_string(),
            &RemoveEntryQueryRequest {
                ..Default::default()
            },
            None,
        )
        .await;
}
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

**address_pattern:** `Option<String>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## events
<details><summary><code>client.events.<a href="/src/api/resources/events/client.rs">create_ticket</a>(request: CreateTicketEventsRequest) -> Result&lt;CreateTicketEventsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .events
        .create_ticket(
            &CreateTicketEventsRequest {
                pod_id: "podId".to_string(),
            },
            None,
        )
        .await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

## billing
<details><summary><code>client.billing.<a href="/src/api/resources/billing/client.rs">get</a>() -> Result&lt;GetBillingResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.billing.get(None).await;
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.billing.<a href="/src/api/resources/billing/client.rs">create_checkout</a>(request: BillingSelection) -> Result&lt;CreateCheckoutBillingResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .billing
        .create_checkout(
            &BillingSelection {
                ..Default::default()
            },
            None,
        )
        .await;
}
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

**inboxes:** `Option<i64>` 
    
</dd>
</dl>

<dl>
<dd>

**monthly_messages:** `Option<i64>` 
    
</dd>
</dl>

<dl>
<dd>

**custom_domains:** `Option<i64>` 
    
</dd>
</dl>

<dl>
<dd>

**interval:** `Option<BillingSelectionInterval>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.billing.<a href="/src/api/resources/billing/client.rs">create_portal</a>() -> Result&lt;CreatePortalBillingResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.billing.create_portal(None).await;
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## a2a
<details><summary><code>client.a2a.<a href="/src/api/resources/a2a/client.rs">send_task</a>(handle: String, request: A2AJsonRpcRequest) -> Result&lt;std::collections::HashMap&lt;String, serde_json::Value&gt;, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .a2a
        .send_task(
            &"handle".to_string(),
            &A2AJsonRpcRequest {
                jsonrpc: A2AJsonRpcRequestJsonrpc::Two0,
                method: "method".to_string(),
                id: None,
                params: None,
            },
            None,
        )
        .await;
}
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

**jsonrpc:** `A2AJsonRpcRequestJsonrpc` 
    
</dd>
</dl>

<dl>
<dd>

**id:** `Option<A2AJsonRpcRequestId>` 
    
</dd>
</dl>

<dl>
<dd>

**method:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**params:** `Option<std::collections::HashMap<String, serde_json::Value>>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2a.<a href="/src/api/resources/a2a/client.rs">get_agent_card</a>(handle: String) -> Result&lt;A2AAgentCard, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client.a2a.get_agent_card(&"handle".to_string(), None).await;
}
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
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2a.<a href="/src/api/resources/a2a/client.rs">update_task</a>(task_id: String, request: A2ATaskUpdate) -> Result&lt;UpdateTaskA2AResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .a2a
        .update_task(
            &"taskId".to_string(),
            &A2ATaskUpdate {
                state: A2ATaskUpdateState::TaskStateSubmitted,
                message: None,
                artifacts: None,
            },
            None,
        )
        .await;
}
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

**state:** `A2ATaskUpdateState` 
    
</dd>
</dl>

<dl>
<dd>

**message:** `Option<A2ATaskUpdateMessage>` 
    
</dd>
</dl>

<dl>
<dd>

**artifacts:** `Option<Vec<A2ATaskUpdateArtifactsItem>>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2a.<a href="/src/api/resources/a2a/client.rs">update_identity</a>(request: A2AIdentitySettings) -> Result&lt;std::collections::HashMap&lt;String, serde_json::Value&gt;, ApiError&gt;</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```rust
use agentmailer::prelude::*;

#[tokio::main]
async fn main() {
    let config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    let client = AgentMailer::new(config).expect("Failed to build client");
    client
        .a2a
        .update_identity(
            &A2AIdentitySettings {
                ..Default::default()
            },
            None,
        )
        .await;
}
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

**publicly_discoverable:** `Option<bool>` 
    
</dd>
</dl>

<dl>
<dd>

**admission_mode:** `Option<A2AIdentitySettingsAdmissionMode>` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `Option<String>` 
    
</dd>
</dl>

<dl>
<dd>

**skills:** `Option<Vec<A2AIdentitySettingsSkillsItem>>` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

