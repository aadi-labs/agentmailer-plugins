# Reference
## agent
<details><summary><code>client.agent.<a href="/Sources/Resources/Agent/AgentClient.swift">bootstrap</a>(idempotencyKey: String, request: Requests.BootstrapRequest, requestOptions: RequestOptions?) -> BootstrapResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.agent.bootstrap(
        idempotencyKey: "Idempotency-Key",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BootstrapRequest`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.agent.<a href="/Sources/Resources/Agent/AgentClient.swift">signUp</a>(request: Requests.SignUpAgentRequest, requestOptions: RequestOptions?) -> SignUpAgentResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.agent.signUp(request: .init(
        humanEmail: "human_email",
        username: "username"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.SignUpAgentRequest`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## inboxes
<details><summary><code>client.inboxes.<a href="/Sources/Resources/Inboxes/InboxesClient.swift">list</a>(limit: Int?, pageToken: String?, requestOptions: RequestOptions?) -> ListInboxesResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.inboxes.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Int?`

</dd>
</dl>

<dl>
<dd>

**pageToken:** `String?`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/Sources/Resources/Inboxes/InboxesClient.swift">create</a>(idempotencyKey: String?, request: Requests.InboxCreate, requestOptions: RequestOptions?) -> CreateInboxesResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.inboxes.create(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String?` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**request:** `Requests.InboxCreate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/Sources/Resources/Inboxes/InboxesClient.swift">get</a>(inboxId: String, requestOptions: RequestOptions?) -> GetInboxesResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.inboxes.get(inboxId: "inboxId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/Sources/Resources/Inboxes/InboxesClient.swift">delete</a>(inboxId: String, requestOptions: RequestOptions?) -> Void</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.inboxes.delete(inboxId: "inboxId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/Sources/Resources/Inboxes/InboxesClient.swift">update</a>(inboxId: String, request: Requests.InboxUpdate, requestOptions: RequestOptions?) -> UpdateInboxesResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.inboxes.update(
        inboxId: "inboxId",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**request:** `Requests.InboxUpdate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.inboxes.<a href="/Sources/Resources/Inboxes/InboxesClient.swift">issueCredentials</a>(inboxId: String, requestOptions: RequestOptions?) -> IssueCredentialsInboxesResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.inboxes.issueCredentials(inboxId: "inboxId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ChannelEndpoints
<details><summary><code>client.channelEndpoints.<a href="/Sources/Resources/ChannelEndpoints/ChannelEndpointsClient.swift">list</a>(requestOptions: RequestOptions?) -> ListChannelEndpointsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.channelEndpoints.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channelEndpoints.<a href="/Sources/Resources/ChannelEndpoints/ChannelEndpointsClient.swift">create</a>(request: Requests.ChannelEndpointCreate, requestOptions: RequestOptions?) -> CreateChannelEndpointsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.channelEndpoints.create(request: .init(
        inboxId: "inboxId",
        podId: "podId",
        channel: .sms
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.ChannelEndpointCreate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channelEndpoints.<a href="/Sources/Resources/ChannelEndpoints/ChannelEndpointsClient.swift">get</a>(endpointId: String, requestOptions: RequestOptions?) -> GetChannelEndpointsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.channelEndpoints.get(endpointId: "endpointId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**endpointId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channelEndpoints.<a href="/Sources/Resources/ChannelEndpoints/ChannelEndpointsClient.swift">update</a>(endpointId: String, request: Requests.ChannelEndpointUpdate, requestOptions: RequestOptions?) -> UpdateChannelEndpointsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.channelEndpoints.update(
        endpointId: "endpointId",
        request: .init(status: .active)
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**endpointId:** `String`

</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ChannelEndpointUpdate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ChannelConversations
<details><summary><code>client.channelConversations.<a href="/Sources/Resources/ChannelConversations/ChannelConversationsClient.swift">list</a>(limit: Int?, pageToken: String?, endpointId: String?, channel: ListChannelConversationsRequestChannel?, status: ListChannelConversationsRequestStatus?, requestOptions: RequestOptions?) -> ListChannelConversationsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.channelConversations.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Int?`

</dd>
</dl>

<dl>
<dd>

**pageToken:** `String?`

</dd>
</dl>

<dl>
<dd>

**endpointId:** `String?`

</dd>
</dl>

<dl>
<dd>

**channel:** `ListChannelConversationsRequestChannel?`

</dd>
</dl>

<dl>
<dd>

**status:** `ListChannelConversationsRequestStatus?`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channelConversations.<a href="/Sources/Resources/ChannelConversations/ChannelConversationsClient.swift">get</a>(conversationId: String, requestOptions: RequestOptions?) -> GetChannelConversationsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.channelConversations.get(conversationId: "conversationId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**conversationId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channelConversations.<a href="/Sources/Resources/ChannelConversations/ChannelConversationsClient.swift">update</a>(conversationId: String, request: Requests.ChannelConversationUpdate, requestOptions: RequestOptions?) -> UpdateChannelConversationsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.channelConversations.update(
        conversationId: "conversationId",
        request: .init(status: .active)
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**conversationId:** `String`

</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ChannelConversationUpdate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ChannelRecipientPermissions
<details><summary><code>client.channelRecipientPermissions.<a href="/Sources/Resources/ChannelRecipientPermissions/ChannelRecipientPermissionsClient.swift">list</a>(limit: Int?, pageToken: String?, endpointId: String?, channel: ListChannelRecipientPermissionsRequestChannel?, status: ListChannelRecipientPermissionsRequestStatus?, requestOptions: RequestOptions?) -> ListChannelRecipientPermissionsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.channelRecipientPermissions.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Int?`

</dd>
</dl>

<dl>
<dd>

**pageToken:** `String?`

</dd>
</dl>

<dl>
<dd>

**endpointId:** `String?`

</dd>
</dl>

<dl>
<dd>

**channel:** `ListChannelRecipientPermissionsRequestChannel?`

</dd>
</dl>

<dl>
<dd>

**status:** `ListChannelRecipientPermissionsRequestStatus?`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ChannelMessages
<details><summary><code>client.channelMessages.<a href="/Sources/Resources/ChannelMessages/ChannelMessagesClient.swift">list</a>(limit: Int?, pageToken: String?, endpointId: String?, conversationId: String?, channel: ListChannelMessagesRequestChannel?, requestOptions: RequestOptions?) -> ListChannelMessagesResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.channelMessages.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Int?`

</dd>
</dl>

<dl>
<dd>

**pageToken:** `String?`

</dd>
</dl>

<dl>
<dd>

**endpointId:** `String?`

</dd>
</dl>

<dl>
<dd>

**conversationId:** `String?`

</dd>
</dl>

<dl>
<dd>

**channel:** `ListChannelMessagesRequestChannel?`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channelMessages.<a href="/Sources/Resources/ChannelMessages/ChannelMessagesClient.swift">send</a>(idempotencyKey: String, request: ChannelMessageSend, requestOptions: RequestOptions?) -> SendChannelMessagesResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.channelMessages.send(
        idempotencyKey: "Idempotency-Key",
        request: ChannelMessageSend.sms(
            ChannelMessageSendSms(
                endpointId: "endpointId",
                to: "to",
                consent: ChannelMessageSendSmsConsent(
                    basis: .explicit,
                    capturedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    reference: "reference"
                ),
                content: ChannelMessageSendSmsContent(
                    type: .text,
                    body: "body"
                )
            )
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**request:** `ChannelMessageSend`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## messages
<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">list</a>(inboxId: String, limit: Int?, pageToken: String?, threadId: String?, label: String?, query: String?, before: Date?, after: Date?, requestOptions: RequestOptions?) -> ListMessagesResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.messages.list(inboxId: "inboxId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**limit:** `Int?`

</dd>
</dl>

<dl>
<dd>

**pageToken:** `String?`

</dd>
</dl>

<dl>
<dd>

**threadId:** `String?`

</dd>
</dl>

<dl>
<dd>

**label:** `String?`

</dd>
</dl>

<dl>
<dd>

**query:** `String?`

</dd>
</dl>

<dl>
<dd>

**before:** `Date?`

</dd>
</dl>

<dl>
<dd>

**after:** `Date?`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">send</a>(inboxId: String, idempotencyKey: String, request: MessageCompose, requestOptions: RequestOptions?) -> SendMessagesResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.messages.send(
        inboxId: "inboxId",
        idempotencyKey: "Idempotency-Key",
        request: MessageCompose(
            to: [
                MessageComposeToItem.string(
                    "to"
                )
            ]
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**request:** `MessageCompose`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">get</a>(inboxId: String, messageId: String, requestOptions: RequestOptions?) -> GetMessagesResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.messages.get(
        inboxId: "inboxId",
        messageId: "messageId"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**messageId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">delete</a>(inboxId: String, messageId: String, requestOptions: RequestOptions?) -> Void</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.messages.delete(
        inboxId: "inboxId",
        messageId: "messageId"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**messageId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">reply</a>(inboxId: String, messageId: String, idempotencyKey: String, request: ReplyCompose, requestOptions: RequestOptions?) -> ReplyMessagesResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.messages.reply(
        inboxId: "inboxId",
        messageId: "messageId",
        idempotencyKey: "Idempotency-Key",
        request: ReplyCompose(

        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**messageId:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**request:** `ReplyCompose`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">replyAll</a>(inboxId: String, messageId: String, idempotencyKey: String, request: ReplyCompose, requestOptions: RequestOptions?) -> ReplyAllMessagesResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.messages.replyAll(
        inboxId: "inboxId",
        messageId: "messageId",
        idempotencyKey: "Idempotency-Key",
        request: ReplyCompose(

        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**messageId:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**request:** `ReplyCompose`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">forward</a>(inboxId: String, messageId: String, idempotencyKey: String, request: MessageCompose, requestOptions: RequestOptions?) -> ForwardMessagesResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.messages.forward(
        inboxId: "inboxId",
        messageId: "messageId",
        idempotencyKey: "Idempotency-Key",
        request: MessageCompose(
            to: [
                MessageComposeToItem.string(
                    "to"
                )
            ]
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**messageId:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**request:** `MessageCompose`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## threads
<details><summary><code>client.threads.<a href="/Sources/Resources/Threads/ThreadsClient.swift">list</a>(inboxId: String, limit: Int?, pageToken: String?, label: String?, query: String?, before: Date?, after: Date?, requestOptions: RequestOptions?) -> ListThreadsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.threads.list(inboxId: "inboxId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**limit:** `Int?`

</dd>
</dl>

<dl>
<dd>

**pageToken:** `String?`

</dd>
</dl>

<dl>
<dd>

**label:** `String?`

</dd>
</dl>

<dl>
<dd>

**query:** `String?`

</dd>
</dl>

<dl>
<dd>

**before:** `Date?`

</dd>
</dl>

<dl>
<dd>

**after:** `Date?`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.threads.<a href="/Sources/Resources/Threads/ThreadsClient.swift">get</a>(inboxId: String, threadId: String, requestOptions: RequestOptions?) -> GetThreadsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.threads.get(
        inboxId: "inboxId",
        threadId: "threadId"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**threadId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## drafts
<details><summary><code>client.drafts.<a href="/Sources/Resources/Drafts/DraftsClient.swift">list</a>(inboxId: String, requestOptions: RequestOptions?) -> ListDraftsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.drafts.list(inboxId: "inboxId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/Sources/Resources/Drafts/DraftsClient.swift">create</a>(inboxId: String, request: Requests.DraftCreate, requestOptions: RequestOptions?) -> CreateDraftsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.drafts.create(
        inboxId: "inboxId",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**request:** `Requests.DraftCreate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/Sources/Resources/Drafts/DraftsClient.swift">get</a>(inboxId: String, draftId: String, requestOptions: RequestOptions?) -> GetDraftsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.drafts.get(
        inboxId: "inboxId",
        draftId: "draftId"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**draftId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/Sources/Resources/Drafts/DraftsClient.swift">delete</a>(inboxId: String, draftId: String, requestOptions: RequestOptions?) -> Void</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.drafts.delete(
        inboxId: "inboxId",
        draftId: "draftId"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**draftId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/Sources/Resources/Drafts/DraftsClient.swift">update</a>(inboxId: String, draftId: String, request: Requests.DraftUpdate, requestOptions: RequestOptions?) -> UpdateDraftsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.drafts.update(
        inboxId: "inboxId",
        draftId: "draftId",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**draftId:** `String`

</dd>
</dl>

<dl>
<dd>

**request:** `Requests.DraftUpdate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.drafts.<a href="/Sources/Resources/Drafts/DraftsClient.swift">send</a>(inboxId: String, draftId: String, idempotencyKey: String, requestOptions: RequestOptions?) -> SendDraftsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.drafts.send(
        inboxId: "inboxId",
        draftId: "draftId",
        idempotencyKey: "Idempotency-Key"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**draftId:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` — Stable caller-generated key used to make retries safe without duplicating the operation.

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## attachments
<details><summary><code>client.attachments.<a href="/Sources/Resources/Attachments/AttachmentsClient.swift">upload</a>(inboxId: String, request: Requests.AttachmentUploadCreate, requestOptions: RequestOptions?) -> [String: JSONValue]</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.attachments.upload(
        inboxId: "inboxId",
        request: .init(
            filename: "filename",
            contentType: "contentType",
            size: 1,
            checksumSha256: "checksumSha256"
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**request:** `Requests.AttachmentUploadCreate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attachments.<a href="/Sources/Resources/Attachments/AttachmentsClient.swift">complete</a>(inboxId: String, attachmentId: String, requestOptions: RequestOptions?) -> CompleteAttachmentsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.attachments.complete(
        inboxId: "inboxId",
        attachmentId: "attachmentId"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**attachmentId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attachments.<a href="/Sources/Resources/Attachments/AttachmentsClient.swift">download</a>(inboxId: String, attachmentId: String, requestOptions: RequestOptions?) -> DownloadAttachmentsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.attachments.download(
        inboxId: "inboxId",
        attachmentId: "attachmentId"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**inboxId:** `String`

</dd>
</dl>

<dl>
<dd>

**attachmentId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## pods
<details><summary><code>client.pods.<a href="/Sources/Resources/Pods/PodsClient.swift">list</a>(requestOptions: RequestOptions?) -> ListPodsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.pods.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/Sources/Resources/Pods/PodsClient.swift">create</a>(request: Requests.PodCreate, requestOptions: RequestOptions?) -> CreatePodsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.pods.create(request: .init(name: "name"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.PodCreate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/Sources/Resources/Pods/PodsClient.swift">get</a>(podId: String, requestOptions: RequestOptions?) -> GetPodsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.pods.get(podId: "podId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**podId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/Sources/Resources/Pods/PodsClient.swift">delete</a>(podId: String, requestOptions: RequestOptions?) -> Void</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.pods.delete(podId: "podId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**podId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pods.<a href="/Sources/Resources/Pods/PodsClient.swift">update</a>(podId: String, request: Requests.PodUpdate, requestOptions: RequestOptions?) -> UpdatePodsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.pods.update(
        podId: "podId",
        request: .init(name: "name")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**podId:** `String`

</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PodUpdate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## domains
<details><summary><code>client.domains.<a href="/Sources/Resources/Domains/DomainsClient.swift">list</a>(requestOptions: RequestOptions?) -> ListDomainsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.domains.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/Sources/Resources/Domains/DomainsClient.swift">create</a>(request: Requests.DomainCreate, requestOptions: RequestOptions?) -> CreateDomainsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.domains.create(request: .init(domain: "domain"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.DomainCreate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/Sources/Resources/Domains/DomainsClient.swift">get</a>(domainId: String, requestOptions: RequestOptions?) -> GetDomainsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.domains.get(domainId: "domainId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**domainId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/Sources/Resources/Domains/DomainsClient.swift">delete</a>(domainId: String, requestOptions: RequestOptions?) -> Void</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.domains.delete(domainId: "domainId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**domainId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/Sources/Resources/Domains/DomainsClient.swift">verify</a>(domainId: String, requestOptions: RequestOptions?) -> VerifyDomainsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.domains.verify(domainId: "domainId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**domainId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## webhooks
<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">list</a>(requestOptions: RequestOptions?) -> ListWebhooksResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.webhooks.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">create</a>(request: Requests.WebhookCreate, requestOptions: RequestOptions?) -> CreateWebhooksResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.webhooks.create(request: .init(url: "url"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.WebhookCreate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">get</a>(webhookId: String, requestOptions: RequestOptions?) -> GetWebhooksResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.webhooks.get(webhookId: "webhookId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">delete</a>(webhookId: String, requestOptions: RequestOptions?) -> Void</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.webhooks.delete(webhookId: "webhookId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">update</a>(webhookId: String, request: Requests.WebhookUpdate, requestOptions: RequestOptions?) -> UpdateWebhooksResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.webhooks.update(
        webhookId: "webhookId",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookId:** `String`

</dd>
</dl>

<dl>
<dd>

**request:** `Requests.WebhookUpdate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">rotateSecret</a>(webhookId: String, requestOptions: RequestOptions?) -> RotateSecretWebhooksResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.webhooks.rotateSecret(webhookId: "webhookId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## labels
<details><summary><code>client.labels.<a href="/Sources/Resources/Labels/LabelsClient.swift">list</a>(podId: String?, requestOptions: RequestOptions?) -> ListLabelsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.labels.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**podId:** `String?`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/Sources/Resources/Labels/LabelsClient.swift">create</a>(request: Requests.LabelCreate, requestOptions: RequestOptions?) -> CreateLabelsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.labels.create(request: .init(
        podId: "podId",
        name: "name"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.LabelCreate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/Sources/Resources/Labels/LabelsClient.swift">delete</a>(labelId: String, requestOptions: RequestOptions?) -> Void</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.labels.delete(labelId: "labelId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**labelId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/Sources/Resources/Labels/LabelsClient.swift">updateMessage</a>(messageId: String, request: LabelMutation, requestOptions: RequestOptions?) -> UpdateMessageLabelsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.labels.updateMessage(
        messageId: "messageId",
        request: LabelMutation(

        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**messageId:** `String`

</dd>
</dl>

<dl>
<dd>

**request:** `LabelMutation`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.labels.<a href="/Sources/Resources/Labels/LabelsClient.swift">updateThread</a>(threadId: String, request: LabelMutation, requestOptions: RequestOptions?) -> UpdateThreadLabelsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.labels.updateThread(
        threadId: "threadId",
        request: LabelMutation(

        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**threadId:** `String`

</dd>
</dl>

<dl>
<dd>

**request:** `LabelMutation`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## lists
<details><summary><code>client.lists.<a href="/Sources/Resources/Lists/ListsClient.swift">list</a>(podId: String?, requestOptions: RequestOptions?) -> ListListsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.lists.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**podId:** `String?`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/Sources/Resources/Lists/ListsClient.swift">create</a>(request: Requests.ListCreate, requestOptions: RequestOptions?) -> CreateListsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.lists.create(request: .init(
        podId: "podId",
        name: "name",
        kind: .allow
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.ListCreate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/Sources/Resources/Lists/ListsClient.swift">delete</a>(listId: String, requestOptions: RequestOptions?) -> Void</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.lists.delete(listId: "listId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**listId:** `String`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/Sources/Resources/Lists/ListsClient.swift">addEntry</a>(listId: String, request: Requests.ListEntry, requestOptions: RequestOptions?) -> AddEntryListsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.lists.addEntry(
        listId: "listId",
        request: .init(addressPattern: "addressPattern")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**listId:** `String`

</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ListEntry`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.lists.<a href="/Sources/Resources/Lists/ListsClient.swift">removeEntry</a>(listId: String, addressPattern: String?, requestOptions: RequestOptions?) -> RemoveEntryListsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.lists.removeEntry(listId: "listId")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**listId:** `String`

</dd>
</dl>

<dl>
<dd>

**addressPattern:** `String?`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## events
<details><summary><code>client.events.<a href="/Sources/Resources/Events/EventsClient.swift">createTicket</a>(request: Requests.CreateTicketEventsRequest, requestOptions: RequestOptions?) -> CreateTicketEventsResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.events.createTicket(request: .init(podId: "podId"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateTicketEventsRequest`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## billing
<details><summary><code>client.billing.<a href="/Sources/Resources/Billing/BillingClient.swift">get</a>(requestOptions: RequestOptions?) -> GetBillingResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.billing.get()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.billing.<a href="/Sources/Resources/Billing/BillingClient.swift">createCheckout</a>(request: Requests.BillingSelection, requestOptions: RequestOptions?) -> CreateCheckoutBillingResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.billing.createCheckout(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.BillingSelection`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.billing.<a href="/Sources/Resources/Billing/BillingClient.swift">createPortal</a>(requestOptions: RequestOptions?) -> CreatePortalBillingResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.billing.createPortal()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## a2a
<details><summary><code>client.a2A.<a href="/Sources/Resources/A2A/A2AClient.swift">sendTask</a>(handle: String, request: Requests.A2AJsonRpcRequest, requestOptions: RequestOptions?) -> [String: JSONValue]</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.a2A.sendTask(
        handle: "handle",
        request: .init(
            jsonrpc: .two0,
            id: .null,
            method: "method"
        )
    )
}

try await main()
```
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

**request:** `Requests.A2AJsonRpcRequest`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2A.<a href="/Sources/Resources/A2A/A2AClient.swift">getAgentCard</a>(handle: String, requestOptions: RequestOptions?) -> A2AAgentCard</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.a2A.getAgentCard(handle: "handle")
}

try await main()
```
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

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2A.<a href="/Sources/Resources/A2A/A2AClient.swift">updateTask</a>(taskId: String, request: Requests.A2ATaskUpdate, requestOptions: RequestOptions?) -> UpdateTaskA2AResponse</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.a2A.updateTask(
        taskId: "taskId",
        request: .init(state: .taskStateSubmitted)
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**taskId:** `String`

</dd>
</dl>

<dl>
<dd>

**request:** `Requests.A2ATaskUpdate`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.a2A.<a href="/Sources/Resources/A2A/A2AClient.swift">updateIdentity</a>(request: Requests.A2AIdentitySettings, requestOptions: RequestOptions?) -> [String: JSONValue]</code></summary>
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

```swift
import Foundation
import AgentMailer

private func main() async throws {
    let client = AgentMailer(apiKey: "<token>")

    _ = try await client.a2A.updateIdentity(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.A2AIdentitySettings`

</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>
