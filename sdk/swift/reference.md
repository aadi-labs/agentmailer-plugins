# Reference
## agent
<details><summary><code>client.agent.<a href="/Sources/Resources/Agent/AgentClient.swift">bootstrap</a>(request: Requests.BootstrapRequest, requestOptions: RequestOptions?) -> BootstrapResponse</code></summary>
<dl>
<dd>

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

    _ = try await client.agent.bootstrap(request: .init())
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

<details><summary><code>client.inboxes.<a href="/Sources/Resources/Inboxes/InboxesClient.swift">create</a>(request: Requests.InboxCreate, requestOptions: RequestOptions?) -> CreateInboxesResponse</code></summary>
<dl>
<dd>

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

## messages
<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">list</a>(inboxId: String, limit: Int?, pageToken: String?, threadId: String?, label: String?, query: String?, before: Date?, after: Date?, requestOptions: RequestOptions?) -> ListMessagesResponse</code></summary>
<dl>
<dd>

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

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">send</a>(inboxId: String, request: MessageCompose, requestOptions: RequestOptions?) -> SendMessagesResponse</code></summary>
<dl>
<dd>

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

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">reply</a>(inboxId: String, messageId: String, request: ReplyCompose, requestOptions: RequestOptions?) -> ReplyMessagesResponse</code></summary>
<dl>
<dd>

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

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">replyAll</a>(inboxId: String, messageId: String, request: ReplyCompose, requestOptions: RequestOptions?) -> ReplyAllMessagesResponse</code></summary>
<dl>
<dd>

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

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">forward</a>(inboxId: String, messageId: String, request: MessageCompose, requestOptions: RequestOptions?) -> ForwardMessagesResponse</code></summary>
<dl>
<dd>

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

<details><summary><code>client.drafts.<a href="/Sources/Resources/Drafts/DraftsClient.swift">send</a>(inboxId: String, draftId: String, requestOptions: RequestOptions?) -> SendDraftsResponse</code></summary>
<dl>
<dd>

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

## attachments
<details><summary><code>client.attachments.<a href="/Sources/Resources/Attachments/AttachmentsClient.swift">upload</a>(inboxId: String, request: Requests.AttachmentUploadCreate, requestOptions: RequestOptions?) -> [String: JSONValue]</code></summary>
<dl>
<dd>

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

