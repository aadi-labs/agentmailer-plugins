# Reference
## agent
<details><summary><code>client.agent.<a href="/src/api/resources/agent/client.rs">bootstrap</a>(request: BootstrapRequest) -> Result&lt;BootstrapResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create an approved agent's inbox
</dd>
</dl>
</dd>
</dl>

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
            Some(RequestOptions::new().additional_header("Idempotency-Key", "Idempotency-Key")),
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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Start human approval for an agent
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List inboxes
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create an inbox
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get an inbox
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete an inbox
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update an inbox
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Issue new IMAP and SMTP credentials
</dd>
</dl>
</dd>
</dl>

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

## ChannelEndpoints
<details><summary><code>client.channel_endpoints.<a href="/src/api/resources/channel_endpoints/client.rs">list</a>() -> Result&lt;ListChannelEndpointsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List human-channel endpoints
</dd>
</dl>
</dd>
</dl>

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
    client.channel_endpoints.list(None).await;
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channel_endpoints.<a href="/src/api/resources/channel_endpoints/client.rs">create</a>(request: ChannelEndpointCreate) -> Result&lt;CreateChannelEndpointsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Assign a human-channel endpoint
</dd>
</dl>
</dd>
</dl>

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
        .channel_endpoints
        .create(
            &ChannelEndpointCreate {
                inbox_id: "inboxId".to_string(),
                pod_id: "podId".to_string(),
                channel: ChannelEndpointCreateChannel::Sms,
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

**pod_id:** `String`

</dd>
</dl>

<dl>
<dd>

**channel:** `ChannelEndpointCreateChannel`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channel_endpoints.<a href="/src/api/resources/channel_endpoints/client.rs">get</a>(endpoint_id: String) -> Result&lt;GetChannelEndpointsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a human-channel endpoint
</dd>
</dl>
</dd>
</dl>

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
        .channel_endpoints
        .get(&"endpointId".to_string(), None)
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

**endpoint_id:** `String`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channel_endpoints.<a href="/src/api/resources/channel_endpoints/client.rs">update</a>(endpoint_id: String, request: ChannelEndpointUpdate) -> Result&lt;UpdateChannelEndpointsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Enable or disable a human-channel endpoint
</dd>
</dl>
</dd>
</dl>

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
        .channel_endpoints
        .update(
            &"endpointId".to_string(),
            &ChannelEndpointUpdate {
                status: ChannelEndpointUpdateStatus::Active,
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

**endpoint_id:** `String`

</dd>
</dl>

<dl>
<dd>

**status:** `ChannelEndpointUpdateStatus`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ChannelConversations
<details><summary><code>client.channel_conversations.<a href="/src/api/resources/channel_conversations/client.rs">list</a>(limit: Option&lt;Option&lt;i64&gt;&gt;, page_token: Option&lt;Option&lt;String&gt;&gt;, endpoint_id: Option&lt;Option&lt;String&gt;&gt;, channel: Option&lt;Option&lt;ListChannelConversationsRequestChannel&gt;&gt;, status: Option&lt;Option&lt;ListChannelConversationsRequestStatus&gt;&gt;) -> Result&lt;ListChannelConversationsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List human-channel conversations
</dd>
</dl>
</dd>
</dl>

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
        .channel_conversations
        .list(
            &ChannelConversationsListQueryRequest {
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

<dl>
<dd>

**endpoint_id:** `Option<String>`

</dd>
</dl>

<dl>
<dd>

**channel:** `Option<ListChannelConversationsRequestChannel>`

</dd>
</dl>

<dl>
<dd>

**status:** `Option<ListChannelConversationsRequestStatus>`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channel_conversations.<a href="/src/api/resources/channel_conversations/client.rs">get</a>(conversation_id: String) -> Result&lt;GetChannelConversationsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a human-channel conversation
</dd>
</dl>
</dd>
</dl>

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
        .channel_conversations
        .get(&"conversationId".to_string(), None)
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

**conversation_id:** `String`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channel_conversations.<a href="/src/api/resources/channel_conversations/client.rs">update</a>(conversation_id: String, request: ChannelConversationUpdate) -> Result&lt;UpdateChannelConversationsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Open or close a human-channel conversation
</dd>
</dl>
</dd>
</dl>

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
        .channel_conversations
        .update(
            &"conversationId".to_string(),
            &ChannelConversationUpdate {
                status: ChannelConversationUpdateStatus::Active,
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

**conversation_id:** `String`

</dd>
</dl>

<dl>
<dd>

**status:** `ChannelConversationUpdateStatus`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ChannelRecipientPermissions
<details><summary><code>client.channel_recipient_permissions.<a href="/src/api/resources/channel_recipient_permissions/client.rs">list</a>(limit: Option&lt;Option&lt;i64&gt;&gt;, page_token: Option&lt;Option&lt;String&gt;&gt;, endpoint_id: Option&lt;Option&lt;String&gt;&gt;, channel: Option&lt;Option&lt;ListChannelRecipientPermissionsRequestChannel&gt;&gt;, status: Option&lt;Option&lt;ListChannelRecipientPermissionsRequestStatus&gt;&gt;) -> Result&lt;ListChannelRecipientPermissionsResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List human-channel consent and opt-out state
</dd>
</dl>
</dd>
</dl>

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
        .channel_recipient_permissions
        .list(
            &ChannelRecipientPermissionsListQueryRequest {
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

<dl>
<dd>

**endpoint_id:** `Option<String>`

</dd>
</dl>

<dl>
<dd>

**channel:** `Option<ListChannelRecipientPermissionsRequestChannel>`

</dd>
</dl>

<dl>
<dd>

**status:** `Option<ListChannelRecipientPermissionsRequestStatus>`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ChannelMessages
<details><summary><code>client.channel_messages.<a href="/src/api/resources/channel_messages/client.rs">list</a>(limit: Option&lt;Option&lt;i64&gt;&gt;, page_token: Option&lt;Option&lt;String&gt;&gt;, endpoint_id: Option&lt;Option&lt;String&gt;&gt;, conversation_id: Option&lt;Option&lt;String&gt;&gt;, channel: Option&lt;Option&lt;ListChannelMessagesRequestChannel&gt;&gt;) -> Result&lt;ListChannelMessagesResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List human-channel messages
</dd>
</dl>
</dd>
</dl>

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
        .channel_messages
        .list(
            &ChannelMessagesListQueryRequest {
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

<dl>
<dd>

**endpoint_id:** `Option<String>`

</dd>
</dl>

<dl>
<dd>

**conversation_id:** `Option<String>`

</dd>
</dl>

<dl>
<dd>

**channel:** `Option<ListChannelMessagesRequestChannel>`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channel_messages.<a href="/src/api/resources/channel_messages/client.rs">send</a>(request: ChannelMessageSend) -> Result&lt;SendChannelMessagesResponse, ApiError&gt;</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sends through an assigned SMS, MMS, RCS, WhatsApp, or outbound voice endpoint. Supports RCS rich cards and replies, plus WhatsApp media and reply buttons. All non-template WhatsApp messages require a recipient message within the last 24 hours; otherwise use an approved template.
</dd>
</dl>
</dd>
</dl>

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
        .channel_messages
        .send(
            &ChannelMessageSend::Sms {
                data: ChannelMessageSendSms {
                    endpoint_id: "endpointId".to_string(),
                    to: "to".to_string(),
                    consent: ChannelMessageSendSmsConsent {
                        basis: ChannelMessageSendSmsConsentBasis::Explicit,
                        captured_at: DateTime::parse_from_rfc3339("2024-01-15T09:30:00Z").unwrap(),
                        reference: "reference".to_string(),
                    },
                    content: ChannelMessageSendSmsContent {
                        r#type: ChannelMessageSendSmsContentType::Text,
                        body: "body".to_string(),
                    },
                    message_type: None,
                },
            },
            Some(RequestOptions::new().additional_header("Idempotency-Key", "Idempotency-Key")),
        )
        .await;
}
```
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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List or search messages
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send a message
</dd>
</dl>
</dd>
</dl>

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
            Some(RequestOptions::new().additional_header("Idempotency-Key", "Idempotency-Key")),
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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a message
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a message
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Reply to a message
</dd>
</dl>
</dd>
</dl>

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
            Some(RequestOptions::new().additional_header("Idempotency-Key", "Idempotency-Key")),
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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Reply all to a message
</dd>
</dl>
</dd>
</dl>

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
            Some(RequestOptions::new().additional_header("Idempotency-Key", "Idempotency-Key")),
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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Forward a message
</dd>
</dl>
</dd>
</dl>

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
            Some(RequestOptions::new().additional_header("Idempotency-Key", "Idempotency-Key")),
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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List or search threads
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a thread and conversation
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List drafts
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a draft
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a draft
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a draft
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a draft
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send a draft
</dd>
</dl>
</dd>
</dl>

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
        .send(
            &"inboxId".to_string(),
            &"draftId".to_string(),
            Some(RequestOptions::new().additional_header("Idempotency-Key", "Idempotency-Key")),
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
</dd>
</dl>


</dd>
</dl>
</details>

## attachments
<details><summary><code>client.attachments.<a href="/src/api/resources/attachments/client.rs">upload</a>(inbox_id: String, request: AttachmentUploadCreate) -> Result&lt;std::collections::HashMap&lt;String, serde_json::Value&gt;, ApiError&gt;</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a direct attachment upload
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Complete a direct attachment upload
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a short-lived attachment download
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List Pods
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a Pod
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a Pod
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a Pod
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a Pod
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List custom domains
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a custom domain
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a custom domain
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a custom domain
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Verify a custom domain's DNS records
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List webhook endpoints
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a webhook endpoint
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a webhook endpoint
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a webhook endpoint
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a webhook endpoint
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Rotate a webhook signing secret
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List labels
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a label
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a label
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add or remove message labels
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add or remove thread labels
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List allow and block lists
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create an allow or block list
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete an allow or block list
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add an address pattern to a list
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove an address pattern from a list
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a short-lived realtime ticket
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get plan and subscription entitlement
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a subscription checkout session
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a billing management session
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Call an agent over A2A JSON-RPC
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Discover an agent's public A2A card
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update an assigned A2A task
</dd>
</dl>
</dd>
</dl>

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

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the calling agent's public A2A profile
</dd>
</dl>
</dd>
</dl>

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
