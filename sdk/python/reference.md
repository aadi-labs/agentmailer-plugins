# Reference
## agent
<details><summary><code>client.agent.<a href="src/agentmailer/agent/client.py">bootstrap</a>(...) -> BootstrapResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.agent.bootstrap(
    idempotency_key="Idempotency-Key",
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

**idempotency_key:** `str` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**requested_local_part:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**pod_name:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.agent.<a href="src/agentmailer/agent/client.py">sign_up</a>(...) -> SignUpAgentResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.agent.sign_up(
    human_email="human_email",
    username="username",
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

**human_email:** `str`

</dd>
</dl>

<dl>
<dd>

**username:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## inboxes
<details><summary><code>client.inboxes.<a href="src/agentmailer/inboxes/client.py">list</a>(...) -> ListInboxesResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.inboxes.list()

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

**limit:** `typing.Optional[int]`

</dd>
</dl>

<dl>
<dd>

**page_token:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="src/agentmailer/inboxes/client.py">create</a>(...) -> CreateInboxesResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.inboxes.create()

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

**idempotency_key:** `typing.Optional[str]` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**username:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**pod_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**domain_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**client_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**display_name:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**metadata:** `typing.Optional[typing.Dict[str, InboxCreateMetadataValue]]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="src/agentmailer/inboxes/client.py">get</a>(...) -> GetInboxesResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.inboxes.get(
    inbox_id="inboxId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="src/agentmailer/inboxes/client.py">delete</a>(...)</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.inboxes.delete(
    inbox_id="inboxId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="src/agentmailer/inboxes/client.py">update</a>(...) -> UpdateInboxesResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.inboxes.update(
    inbox_id="inboxId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**display_name:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**client_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**metadata:** `typing.Optional[typing.Dict[str, typing.Optional[InboxUpdateMetadataValue]]]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="src/agentmailer/inboxes/client.py">issue_credentials</a>(...) -> IssueCredentialsInboxesResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.inboxes.issue_credentials(
    inbox_id="inboxId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ChannelEndpoints
<details><summary><code>client.channel_endpoints.<a href="src/agentmailer/channel_endpoints/client.py">list</a>() -> ListChannelEndpointsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.channel_endpoints.list()

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

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channel_endpoints.<a href="src/agentmailer/channel_endpoints/client.py">create</a>(...) -> CreateChannelEndpointsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.channel_endpoints.create(
    inbox_id="inboxId",
    pod_id="podId",
    channel="sms",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**pod_id:** `str`

</dd>
</dl>

<dl>
<dd>

**channel:** `ChannelEndpointCreateChannel`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channel_endpoints.<a href="src/agentmailer/channel_endpoints/client.py">get</a>(...) -> GetChannelEndpointsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.channel_endpoints.get(
    endpoint_id="endpointId",
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

**endpoint_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channel_endpoints.<a href="src/agentmailer/channel_endpoints/client.py">update</a>(...) -> UpdateChannelEndpointsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.channel_endpoints.update(
    endpoint_id="endpointId",
    status="active",
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

**endpoint_id:** `str`

</dd>
</dl>

<dl>
<dd>

**status:** `ChannelEndpointUpdateStatus`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ChannelConversations
<details><summary><code>client.channel_conversations.<a href="src/agentmailer/channel_conversations/client.py">list</a>(...) -> ListChannelConversationsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.channel_conversations.list()

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

**limit:** `typing.Optional[int]`

</dd>
</dl>

<dl>
<dd>

**page_token:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**endpoint_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**channel:** `typing.Optional[ListChannelConversationsRequestChannel]`

</dd>
</dl>

<dl>
<dd>

**status:** `typing.Optional[ListChannelConversationsRequestStatus]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channel_conversations.<a href="src/agentmailer/channel_conversations/client.py">get</a>(...) -> GetChannelConversationsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.channel_conversations.get(
    conversation_id="conversationId",
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

**conversation_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channel_conversations.<a href="src/agentmailer/channel_conversations/client.py">update</a>(...) -> UpdateChannelConversationsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.channel_conversations.update(
    conversation_id="conversationId",
    status="active",
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

**conversation_id:** `str`

</dd>
</dl>

<dl>
<dd>

**status:** `ChannelConversationUpdateStatus`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ChannelRecipientPermissions
<details><summary><code>client.channel_recipient_permissions.<a href="src/agentmailer/channel_recipient_permissions/client.py">list</a>(...) -> ListChannelRecipientPermissionsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.channel_recipient_permissions.list()

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

**limit:** `typing.Optional[int]`

</dd>
</dl>

<dl>
<dd>

**page_token:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**endpoint_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**channel:** `typing.Optional[ListChannelRecipientPermissionsRequestChannel]`

</dd>
</dl>

<dl>
<dd>

**status:** `typing.Optional[ListChannelRecipientPermissionsRequestStatus]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ChannelMessages
<details><summary><code>client.channel_messages.<a href="src/agentmailer/channel_messages/client.py">list</a>(...) -> ListChannelMessagesResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.channel_messages.list()

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

**limit:** `typing.Optional[int]`

</dd>
</dl>

<dl>
<dd>

**page_token:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**endpoint_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**conversation_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**channel:** `typing.Optional[ListChannelMessagesRequestChannel]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channel_messages.<a href="src/agentmailer/channel_messages/client.py">send</a>(...) -> SendChannelMessagesResponse</code></summary>
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

```python
from agentmailer import AgentMailer, ChannelMessageSend_Sms, ChannelMessageSendSmsConsent, ChannelMessageSendSmsContent
from agentmailer.environment import AgentMailerEnvironment
import datetime

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.channel_messages.send(
    idempotency_key="Idempotency-Key",
    request=ChannelMessageSend_Sms(
        endpoint_id="endpointId",
        to="to",
        consent=ChannelMessageSendSmsConsent(
            basis="explicit",
            captured_at=datetime.datetime.fromisoformat("2024-01-15T09:30:00+00:00"),
            reference="reference",
        ),
        content=ChannelMessageSendSmsContent(
            type="text",
            body="body",
        ),
    ),
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

**idempotency_key:** `str` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**request:** `ChannelMessageSend`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## messages
<details><summary><code>client.messages.<a href="src/agentmailer/messages/client.py">list</a>(...) -> ListMessagesResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.messages.list(
    inbox_id="inboxId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**limit:** `typing.Optional[int]`

</dd>
</dl>

<dl>
<dd>

**page_token:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**thread_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**label:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**query:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**before:** `typing.Optional[datetime.datetime]`

</dd>
</dl>

<dl>
<dd>

**after:** `typing.Optional[datetime.datetime]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="src/agentmailer/messages/client.py">send</a>(...) -> SendMessagesResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.messages.send(
    inbox_id="inboxId",
    idempotency_key="Idempotency-Key",
    to=[
        "to"
    ],
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `str` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**request:** `MessageCompose`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="src/agentmailer/messages/client.py">get</a>(...) -> GetMessagesResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.messages.get(
    inbox_id="inboxId",
    message_id="messageId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**message_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="src/agentmailer/messages/client.py">delete</a>(...)</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.messages.delete(
    inbox_id="inboxId",
    message_id="messageId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**message_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="src/agentmailer/messages/client.py">reply</a>(...) -> ReplyMessagesResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.messages.reply(
    inbox_id="inboxId",
    message_id="messageId",
    idempotency_key="Idempotency-Key",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**message_id:** `str`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `str` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**request:** `ReplyCompose`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="src/agentmailer/messages/client.py">reply_all</a>(...) -> ReplyAllMessagesResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.messages.reply_all(
    inbox_id="inboxId",
    message_id="messageId",
    idempotency_key="Idempotency-Key",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**message_id:** `str`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `str` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**request:** `ReplyCompose`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="src/agentmailer/messages/client.py">forward</a>(...) -> ForwardMessagesResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.messages.forward(
    inbox_id="inboxId",
    message_id="messageId",
    idempotency_key="Idempotency-Key",
    to=[
        "to"
    ],
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**message_id:** `str`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `str` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**request:** `MessageCompose`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## threads
<details><summary><code>client.threads.<a href="src/agentmailer/threads/client.py">list</a>(...) -> ListThreadsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.threads.list(
    inbox_id="inboxId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**limit:** `typing.Optional[int]`

</dd>
</dl>

<dl>
<dd>

**page_token:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**label:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**query:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**before:** `typing.Optional[datetime.datetime]`

</dd>
</dl>

<dl>
<dd>

**after:** `typing.Optional[datetime.datetime]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.threads.<a href="src/agentmailer/threads/client.py">get</a>(...) -> GetThreadsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.threads.get(
    inbox_id="inboxId",
    thread_id="threadId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**thread_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## drafts
<details><summary><code>client.drafts.<a href="src/agentmailer/drafts/client.py">list</a>(...) -> ListDraftsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.drafts.list(
    inbox_id="inboxId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="src/agentmailer/drafts/client.py">create</a>(...) -> CreateDraftsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.drafts.create(
    inbox_id="inboxId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**to:** `typing.Optional[typing.List[DraftCreateToItem]]`

</dd>
</dl>

<dl>
<dd>

**cc:** `typing.Optional[typing.List[DraftCreateCcItem]]`

</dd>
</dl>

<dl>
<dd>

**bcc:** `typing.Optional[typing.List[DraftCreateBccItem]]`

</dd>
</dl>

<dl>
<dd>

**reply_to:** `typing.Optional[typing.List[DraftCreateReplyToItem]]`

</dd>
</dl>

<dl>
<dd>

**subject:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**text:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**html:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**headers:** `typing.Optional[typing.Dict[str, str]]`

</dd>
</dl>

<dl>
<dd>

**attachments:** `typing.Optional[typing.List[DraftCreateAttachmentsItem]]`

</dd>
</dl>

<dl>
<dd>

**reply_to_message_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**forward_message_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**send_at:** `typing.Optional[datetime.datetime]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="src/agentmailer/drafts/client.py">get</a>(...) -> GetDraftsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.drafts.get(
    inbox_id="inboxId",
    draft_id="draftId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**draft_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="src/agentmailer/drafts/client.py">delete</a>(...)</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.drafts.delete(
    inbox_id="inboxId",
    draft_id="draftId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**draft_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="src/agentmailer/drafts/client.py">update</a>(...) -> UpdateDraftsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.drafts.update(
    inbox_id="inboxId",
    draft_id="draftId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**draft_id:** `str`

</dd>
</dl>

<dl>
<dd>

**to:** `typing.Optional[typing.List[DraftUpdateToItem]]`

</dd>
</dl>

<dl>
<dd>

**cc:** `typing.Optional[typing.List[DraftUpdateCcItem]]`

</dd>
</dl>

<dl>
<dd>

**bcc:** `typing.Optional[typing.List[DraftUpdateBccItem]]`

</dd>
</dl>

<dl>
<dd>

**reply_to:** `typing.Optional[typing.List[DraftUpdateReplyToItem]]`

</dd>
</dl>

<dl>
<dd>

**subject:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**text:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**html:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**headers:** `typing.Optional[typing.Dict[str, str]]`

</dd>
</dl>

<dl>
<dd>

**attachments:** `typing.Optional[typing.List[DraftUpdateAttachmentsItem]]`

</dd>
</dl>

<dl>
<dd>

**reply_to_message_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**forward_message_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**send_at:** `typing.Optional[datetime.datetime]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="src/agentmailer/drafts/client.py">send</a>(...) -> SendDraftsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.drafts.send(
    inbox_id="inboxId",
    draft_id="draftId",
    idempotency_key="Idempotency-Key",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**draft_id:** `str`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `str` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## attachments
<details><summary><code>client.attachments.<a href="src/agentmailer/attachments/client.py">upload</a>(...) -> typing.Dict[str, typing.Any]</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.attachments.upload(
    inbox_id="inboxId",
    filename="filename",
    content_type="contentType",
    size=1,
    checksum_sha256="checksumSha256",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**filename:** `str`

</dd>
</dl>

<dl>
<dd>

**content_type:** `str`

</dd>
</dl>

<dl>
<dd>

**size:** `int`

</dd>
</dl>

<dl>
<dd>

**checksum_sha256:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attachments.<a href="src/agentmailer/attachments/client.py">complete</a>(...) -> CompleteAttachmentsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.attachments.complete(
    inbox_id="inboxId",
    attachment_id="attachmentId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**attachment_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attachments.<a href="src/agentmailer/attachments/client.py">download</a>(...) -> DownloadAttachmentsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.attachments.download(
    inbox_id="inboxId",
    attachment_id="attachmentId",
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

**inbox_id:** `str`

</dd>
</dl>

<dl>
<dd>

**attachment_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## pods
<details><summary><code>client.pods.<a href="src/agentmailer/pods/client.py">list</a>() -> ListPodsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.pods.list()

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

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="src/agentmailer/pods/client.py">create</a>(...) -> CreatePodsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.pods.create(
    name="name",
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

**name:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="src/agentmailer/pods/client.py">get</a>(...) -> GetPodsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.pods.get(
    pod_id="podId",
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

**pod_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="src/agentmailer/pods/client.py">delete</a>(...)</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.pods.delete(
    pod_id="podId",
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

**pod_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="src/agentmailer/pods/client.py">update</a>(...) -> UpdatePodsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.pods.update(
    pod_id="podId",
    name="name",
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

**pod_id:** `str`

</dd>
</dl>

<dl>
<dd>

**name:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## domains
<details><summary><code>client.domains.<a href="src/agentmailer/domains/client.py">list</a>() -> ListDomainsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.domains.list()

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

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="src/agentmailer/domains/client.py">create</a>(...) -> CreateDomainsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.domains.create(
    domain="domain",
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

**domain:** `str`

</dd>
</dl>

<dl>
<dd>

**pod_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="src/agentmailer/domains/client.py">get</a>(...) -> GetDomainsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.domains.get(
    domain_id="domainId",
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

**domain_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="src/agentmailer/domains/client.py">delete</a>(...)</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.domains.delete(
    domain_id="domainId",
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

**domain_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="src/agentmailer/domains/client.py">verify</a>(...) -> VerifyDomainsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.domains.verify(
    domain_id="domainId",
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

**domain_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## webhooks
<details><summary><code>client.webhooks.<a href="src/agentmailer/webhooks/client.py">list</a>() -> ListWebhooksResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.webhooks.list()

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

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="src/agentmailer/webhooks/client.py">create</a>(...) -> CreateWebhooksResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.webhooks.create(
    url="url",
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

**url:** `str`

</dd>
</dl>

<dl>
<dd>

**pod_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**inbox_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**event_types:** `typing.Optional[typing.List[WebhookCreateEventTypesItem]]`

</dd>
</dl>

<dl>
<dd>

**description:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="src/agentmailer/webhooks/client.py">get</a>(...) -> GetWebhooksResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.webhooks.get(
    webhook_id="webhookId",
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

**webhook_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="src/agentmailer/webhooks/client.py">delete</a>(...)</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.webhooks.delete(
    webhook_id="webhookId",
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

**webhook_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="src/agentmailer/webhooks/client.py">update</a>(...) -> UpdateWebhooksResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.webhooks.update(
    webhook_id="webhookId",
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

**webhook_id:** `str`

</dd>
</dl>

<dl>
<dd>

**url:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**event_types:** `typing.Optional[typing.List[WebhookUpdateEventTypesItem]]`

</dd>
</dl>

<dl>
<dd>

**description:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**enabled:** `typing.Optional[bool]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="src/agentmailer/webhooks/client.py">rotate_secret</a>(...) -> RotateSecretWebhooksResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.webhooks.rotate_secret(
    webhook_id="webhookId",
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

**webhook_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## labels
<details><summary><code>client.labels.<a href="src/agentmailer/labels/client.py">list</a>(...) -> ListLabelsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.labels.list()

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

**pod_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="src/agentmailer/labels/client.py">create</a>(...) -> CreateLabelsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.labels.create(
    pod_id="podId",
    name="name",
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

**pod_id:** `str`

</dd>
</dl>

<dl>
<dd>

**name:** `str`

</dd>
</dl>

<dl>
<dd>

**color:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="src/agentmailer/labels/client.py">delete</a>(...)</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.labels.delete(
    label_id="labelId",
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

**label_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="src/agentmailer/labels/client.py">update_message</a>(...) -> UpdateMessageLabelsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.labels.update_message(
    message_id="messageId",
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

**message_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request:** `LabelMutation`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="src/agentmailer/labels/client.py">update_thread</a>(...) -> UpdateThreadLabelsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.labels.update_thread(
    thread_id="threadId",
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

**thread_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request:** `LabelMutation`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## lists
<details><summary><code>client.lists.<a href="src/agentmailer/lists/client.py">list</a>(...) -> ListListsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.lists.list()

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

**pod_id:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="src/agentmailer/lists/client.py">create</a>(...) -> CreateListsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.lists.create(
    pod_id="podId",
    name="name",
    kind="allow",
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

**pod_id:** `str`

</dd>
</dl>

<dl>
<dd>

**name:** `str`

</dd>
</dl>

<dl>
<dd>

**kind:** `ListCreateKind`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="src/agentmailer/lists/client.py">delete</a>(...)</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.lists.delete(
    list_id="listId",
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

**list_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="src/agentmailer/lists/client.py">add_entry</a>(...) -> AddEntryListsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.lists.add_entry(
    list_id="listId",
    address_pattern="addressPattern",
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

**list_id:** `str`

</dd>
</dl>

<dl>
<dd>

**address_pattern:** `str`

</dd>
</dl>

<dl>
<dd>

**note:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="src/agentmailer/lists/client.py">remove_entry</a>(...) -> RemoveEntryListsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.lists.remove_entry(
    list_id="listId",
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

**list_id:** `str`

</dd>
</dl>

<dl>
<dd>

**address_pattern:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## events
<details><summary><code>client.events.<a href="src/agentmailer/events/client.py">create_ticket</a>(...) -> CreateTicketEventsResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.events.create_ticket(
    pod_id="podId",
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

**pod_id:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## billing
<details><summary><code>client.billing.<a href="src/agentmailer/billing/client.py">get</a>() -> GetBillingResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.billing.get()

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

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.billing.<a href="src/agentmailer/billing/client.py">create_checkout</a>(...) -> CreateCheckoutBillingResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.billing.create_checkout()

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

**inboxes:** `typing.Optional[int]`

</dd>
</dl>

<dl>
<dd>

**monthly_messages:** `typing.Optional[int]`

</dd>
</dl>

<dl>
<dd>

**custom_domains:** `typing.Optional[int]`

</dd>
</dl>

<dl>
<dd>

**interval:** `typing.Optional[BillingSelectionInterval]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.billing.<a href="src/agentmailer/billing/client.py">create_portal</a>() -> CreatePortalBillingResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.billing.create_portal()

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

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## a2a
<details><summary><code>client.a2a.<a href="src/agentmailer/a2a/client.py">send_task</a>(...) -> typing.Dict[str, typing.Any]</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.a2a.send_task(
    handle="handle",
    jsonrpc="2.0",
    method="method",
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

**handle:** `str`

</dd>
</dl>

<dl>
<dd>

**jsonrpc:** `A2AJsonRpcRequestJsonrpc`

</dd>
</dl>

<dl>
<dd>

**method:** `str`

</dd>
</dl>

<dl>
<dd>

**id:** `typing.Optional[A2AJsonRpcRequestId]`

</dd>
</dl>

<dl>
<dd>

**params:** `typing.Optional[typing.Dict[str, typing.Any]]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2a.<a href="src/agentmailer/a2a/client.py">get_agent_card</a>(...) -> A2AAgentCard</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.a2a.get_agent_card(
    handle="handle",
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

**handle:** `str`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2a.<a href="src/agentmailer/a2a/client.py">update_task</a>(...) -> UpdateTaskA2AResponse</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.a2a.update_task(
    task_id="taskId",
    state="TASK_STATE_SUBMITTED",
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

**task_id:** `str`

</dd>
</dl>

<dl>
<dd>

**state:** `A2ATaskUpdateState`

</dd>
</dl>

<dl>
<dd>

**message:** `typing.Optional[A2ATaskUpdateMessage]`

</dd>
</dl>

<dl>
<dd>

**artifacts:** `typing.Optional[typing.List[A2ATaskUpdateArtifactsItem]]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2a.<a href="src/agentmailer/a2a/client.py">update_identity</a>(...) -> typing.Dict[str, typing.Any]</code></summary>
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

```python
from agentmailer import AgentMailer
from agentmailer.environment import AgentMailerEnvironment

client = AgentMailer(
    api_key="<token>",
    environment=AgentMailerEnvironment.DEFAULT,
)

client.a2a.update_identity()

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

**publicly_discoverable:** `typing.Optional[bool]`

</dd>
</dl>

<dl>
<dd>

**admission_mode:** `typing.Optional[A2AIdentitySettingsAdmissionMode]`

</dd>
</dl>

<dl>
<dd>

**name:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**description:** `typing.Optional[str]`

</dd>
</dl>

<dl>
<dd>

**skills:** `typing.Optional[typing.List[A2AIdentitySettingsSkillsItem]]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `typing.Optional[RequestOptions]` — Request-specific configuration.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>
