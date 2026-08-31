# Reference
## agent
<details><summary><code>client.Agent.Bootstrap(request) -> *_go.BootstrapResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.BootstrapRequest{}
client.Agent.Bootstrap(
    context.TODO(),
    request,
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

**requestedLocalPart:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**podName:** `*string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Agent.SignUp(request) -> *_go.SignUpAgentResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.SignUpAgentRequest{
    HumanEmail: "human_email",
    Username: "username",
}
client.Agent.SignUp(
    context.TODO(),
    request,
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

**humanEmail:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**username:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## inboxes
<details><summary><code>client.Inboxes.List() -> *_go.ListInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.ListInboxesRequest{}
client.Inboxes.List(
    context.TODO(),
    request,
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

**limit:** `*int` 
    
</dd>
</dl>

<dl>
<dd>

**pageToken:** `*string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inboxes.Create(request) -> *_go.CreateInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.InboxCreate{}
client.Inboxes.Create(
    context.TODO(),
    request,
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

**username:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**podID:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**domainID:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**clientID:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**displayName:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `map[string]*_go.InboxCreateMetadataValue` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inboxes.Get(InboxID) -> *_go.GetInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Inboxes.Get(
    context.TODO(),
    "inboxId",
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

**inboxID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inboxes.Delete(InboxID) -> error</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Inboxes.Delete(
    context.TODO(),
    "inboxId",
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

**inboxID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inboxes.Update(InboxID, request) -> *_go.UpdateInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.InboxUpdate{}
client.Inboxes.Update(
    context.TODO(),
    "inboxId",
    request,
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**displayName:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**clientID:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `map[string]*_go.InboxUpdateMetadataValue` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inboxes.IssueCredentials(InboxID) -> *_go.IssueCredentialsInboxesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Inboxes.IssueCredentials(
    context.TODO(),
    "inboxId",
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

**inboxID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## messages
<details><summary><code>client.Messages.List(InboxID) -> *_go.ListMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.ListMessagesRequest{}
client.Messages.List(
    context.TODO(),
    "inboxId",
    request,
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `*int` 
    
</dd>
</dl>

<dl>
<dd>

**pageToken:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**threadID:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**label:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**query:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**before:** `*time.Time` 
    
</dd>
</dl>

<dl>
<dd>

**after:** `*time.Time` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Messages.Send(InboxID, request) -> *_go.SendMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.MessageCompose{
    To: []*_go.MessageComposeToItem{
        &_go.MessageComposeToItem{
            String: "to",
        },
    },
}
client.Messages.Send(
    context.TODO(),
    "inboxId",
    request,
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `*_go.MessageCompose` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Messages.Get(InboxID, MessageID) -> *_go.GetMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Messages.Get(
    context.TODO(),
    "inboxId",
    "messageId",
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**messageID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Messages.Delete(InboxID, MessageID) -> error</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Messages.Delete(
    context.TODO(),
    "inboxId",
    "messageId",
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**messageID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Messages.Reply(InboxID, MessageID, request) -> *_go.ReplyMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.ReplyCompose{}
client.Messages.Reply(
    context.TODO(),
    "inboxId",
    "messageId",
    request,
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**messageID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `*_go.ReplyCompose` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Messages.ReplyAll(InboxID, MessageID, request) -> *_go.ReplyAllMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.ReplyCompose{}
client.Messages.ReplyAll(
    context.TODO(),
    "inboxId",
    "messageId",
    request,
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**messageID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `*_go.ReplyCompose` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Messages.Forward(InboxID, MessageID, request) -> *_go.ForwardMessagesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.MessageCompose{
    To: []*_go.MessageComposeToItem{
        &_go.MessageComposeToItem{
            String: "to",
        },
    },
}
client.Messages.Forward(
    context.TODO(),
    "inboxId",
    "messageId",
    request,
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**messageID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `*_go.MessageCompose` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## threads
<details><summary><code>client.Threads.List(InboxID) -> *_go.ListThreadsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.ListThreadsRequest{}
client.Threads.List(
    context.TODO(),
    "inboxId",
    request,
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `*int` 
    
</dd>
</dl>

<dl>
<dd>

**pageToken:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**label:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**query:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**before:** `*time.Time` 
    
</dd>
</dl>

<dl>
<dd>

**after:** `*time.Time` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Threads.Get(InboxID, ThreadID) -> *_go.GetThreadsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Threads.Get(
    context.TODO(),
    "inboxId",
    "threadId",
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**threadID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## drafts
<details><summary><code>client.Drafts.List(InboxID) -> *_go.ListDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Drafts.List(
    context.TODO(),
    "inboxId",
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

**inboxID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Drafts.Create(InboxID, request) -> *_go.CreateDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.DraftCreate{}
client.Drafts.Create(
    context.TODO(),
    "inboxId",
    request,
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**to:** `[]*_go.DraftCreateToItem` 
    
</dd>
</dl>

<dl>
<dd>

**cc:** `[]*_go.DraftCreateCcItem` 
    
</dd>
</dl>

<dl>
<dd>

**bcc:** `[]*_go.DraftCreateBccItem` 
    
</dd>
</dl>

<dl>
<dd>

**replyTo:** `[]*_go.DraftCreateReplyToItem` 
    
</dd>
</dl>

<dl>
<dd>

**subject:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**text:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**html:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**headers:** `map[string]string` 
    
</dd>
</dl>

<dl>
<dd>

**attachments:** `[]*_go.DraftCreateAttachmentsItem` 
    
</dd>
</dl>

<dl>
<dd>

**replyToMessageID:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**forwardMessageID:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**sendAt:** `*time.Time` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Drafts.Get(InboxID, DraftID) -> *_go.GetDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Drafts.Get(
    context.TODO(),
    "inboxId",
    "draftId",
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**draftID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Drafts.Delete(InboxID, DraftID) -> error</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Drafts.Delete(
    context.TODO(),
    "inboxId",
    "draftId",
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**draftID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Drafts.Update(InboxID, DraftID, request) -> *_go.UpdateDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.DraftUpdate{}
client.Drafts.Update(
    context.TODO(),
    "inboxId",
    "draftId",
    request,
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**draftID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**to:** `[]*_go.DraftUpdateToItem` 
    
</dd>
</dl>

<dl>
<dd>

**cc:** `[]*_go.DraftUpdateCcItem` 
    
</dd>
</dl>

<dl>
<dd>

**bcc:** `[]*_go.DraftUpdateBccItem` 
    
</dd>
</dl>

<dl>
<dd>

**replyTo:** `[]*_go.DraftUpdateReplyToItem` 
    
</dd>
</dl>

<dl>
<dd>

**subject:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**text:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**html:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**headers:** `map[string]string` 
    
</dd>
</dl>

<dl>
<dd>

**attachments:** `[]*_go.DraftUpdateAttachmentsItem` 
    
</dd>
</dl>

<dl>
<dd>

**replyToMessageID:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**forwardMessageID:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**sendAt:** `*time.Time` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Drafts.Send(InboxID, DraftID) -> *_go.SendDraftsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Drafts.Send(
    context.TODO(),
    "inboxId",
    "draftId",
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**draftID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## attachments
<details><summary><code>client.Attachments.Upload(InboxID, request) -> map[string]any</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.AttachmentUploadCreate{
    Filename: "filename",
    ContentType: "contentType",
    Size: 1,
    ChecksumSha256: "checksumSha256",
}
client.Attachments.Upload(
    context.TODO(),
    "inboxId",
    request,
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**filename:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**contentType:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**size:** `int` 
    
</dd>
</dl>

<dl>
<dd>

**checksumSha256:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Attachments.Complete(InboxID, AttachmentID) -> *_go.CompleteAttachmentsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Attachments.Complete(
    context.TODO(),
    "inboxId",
    "attachmentId",
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**attachmentID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Attachments.Download(InboxID, AttachmentID) -> *_go.DownloadAttachmentsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Attachments.Download(
    context.TODO(),
    "inboxId",
    "attachmentId",
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

**inboxID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**attachmentID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## pods
<details><summary><code>client.Pods.List() -> *_go.ListPodsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Pods.List(
    context.TODO(),
)
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Pods.Create(request) -> *_go.CreatePodsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.PodCreate{
    Name: "name",
}
client.Pods.Create(
    context.TODO(),
    request,
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

**name:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Pods.Get(PodID) -> *_go.GetPodsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Pods.Get(
    context.TODO(),
    "podId",
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

**podID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Pods.Delete(PodID) -> error</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Pods.Delete(
    context.TODO(),
    "podId",
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

**podID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Pods.Update(PodID, request) -> *_go.UpdatePodsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.PodUpdate{
    Name: "name",
}
client.Pods.Update(
    context.TODO(),
    "podId",
    request,
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

**podID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## domains
<details><summary><code>client.Domains.List() -> *_go.ListDomainsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Domains.List(
    context.TODO(),
)
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Domains.Create(request) -> *_go.CreateDomainsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.DomainCreate{
    Domain: "domain",
}
client.Domains.Create(
    context.TODO(),
    request,
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

**domain:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**podID:** `*string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Domains.Get(DomainID) -> *_go.GetDomainsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Domains.Get(
    context.TODO(),
    "domainId",
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

**domainID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Domains.Delete(DomainID) -> error</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Domains.Delete(
    context.TODO(),
    "domainId",
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

**domainID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Domains.Verify(DomainID) -> *_go.VerifyDomainsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Domains.Verify(
    context.TODO(),
    "domainId",
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

**domainID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## webhooks
<details><summary><code>client.Webhooks.List() -> *_go.ListWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Webhooks.List(
    context.TODO(),
)
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webhooks.Create(request) -> *_go.CreateWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.WebhookCreate{
    URL: "url",
}
client.Webhooks.Create(
    context.TODO(),
    request,
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

**url:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**podID:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**inboxID:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**eventTypes:** `[]*_go.WebhookCreateEventTypesItem` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `*string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webhooks.Get(WebhookID) -> *_go.GetWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Webhooks.Get(
    context.TODO(),
    "webhookId",
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

**webhookID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webhooks.Delete(WebhookID) -> error</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Webhooks.Delete(
    context.TODO(),
    "webhookId",
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

**webhookID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webhooks.Update(WebhookID, request) -> *_go.UpdateWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.WebhookUpdate{}
client.Webhooks.Update(
    context.TODO(),
    "webhookId",
    request,
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

**webhookID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**url:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**eventTypes:** `[]*_go.WebhookUpdateEventTypesItem` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `*bool` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webhooks.RotateSecret(WebhookID) -> *_go.RotateSecretWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Webhooks.RotateSecret(
    context.TODO(),
    "webhookId",
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

**webhookID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## labels
<details><summary><code>client.Labels.List() -> *_go.ListLabelsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.ListLabelsRequest{}
client.Labels.List(
    context.TODO(),
    request,
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

**podID:** `*string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labels.Create(request) -> *_go.CreateLabelsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.LabelCreate{
    PodID: "podId",
    Name: "name",
}
client.Labels.Create(
    context.TODO(),
    request,
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

**podID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**color:** `*string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labels.Delete(LabelID) -> error</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Labels.Delete(
    context.TODO(),
    "labelId",
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

**labelID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labels.UpdateMessage(MessageID, request) -> *_go.UpdateMessageLabelsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.LabelMutation{}
client.Labels.UpdateMessage(
    context.TODO(),
    "messageId",
    request,
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

**messageID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `*_go.LabelMutation` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labels.UpdateThread(ThreadID, request) -> *_go.UpdateThreadLabelsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.LabelMutation{}
client.Labels.UpdateThread(
    context.TODO(),
    "threadId",
    request,
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

**threadID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `*_go.LabelMutation` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## lists
<details><summary><code>client.Lists.List() -> *_go.ListListsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.ListListsRequest{}
client.Lists.List(
    context.TODO(),
    request,
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

**podID:** `*string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Lists.Create(request) -> *_go.CreateListsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.ListCreate{
    PodID: "podId",
    Name: "name",
    Kind: _go.ListCreateKindAllow,
}
client.Lists.Create(
    context.TODO(),
    request,
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

**podID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**kind:** `*_go.ListCreateKind` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Lists.Delete(ListID) -> error</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Lists.Delete(
    context.TODO(),
    "listId",
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

**listID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Lists.AddEntry(ListID, request) -> *_go.AddEntryListsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.ListEntry{
    AddressPattern: "addressPattern",
}
client.Lists.AddEntry(
    context.TODO(),
    "listId",
    request,
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

**listID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**addressPattern:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**note:** `*string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Lists.RemoveEntry(ListID) -> *_go.RemoveEntryListsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.RemoveEntryListsRequest{}
client.Lists.RemoveEntry(
    context.TODO(),
    "listId",
    request,
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

**listID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**addressPattern:** `*string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## events
<details><summary><code>client.Events.CreateTicket(request) -> *_go.CreateTicketEventsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.CreateTicketEventsRequest{
    PodID: "podId",
}
client.Events.CreateTicket(
    context.TODO(),
    request,
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

**podID:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## billing
<details><summary><code>client.Billing.Get() -> *_go.GetBillingResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Billing.Get(
    context.TODO(),
)
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Billing.CreateCheckout(request) -> *_go.CreateCheckoutBillingResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.BillingSelection{}
client.Billing.CreateCheckout(
    context.TODO(),
    request,
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

**inboxes:** `*int` 
    
</dd>
</dl>

<dl>
<dd>

**monthlyMessages:** `*int` 
    
</dd>
</dl>

<dl>
<dd>

**customDomains:** `*int` 
    
</dd>
</dl>

<dl>
<dd>

**interval:** `*_go.BillingSelectionInterval` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Billing.CreatePortal() -> *_go.CreatePortalBillingResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Billing.CreatePortal(
    context.TODO(),
)
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## a2a
<details><summary><code>client.A2A.SendTask(Handle, request) -> map[string]any</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.A2AJsonRpcRequest{
    Jsonrpc: _go.A2AJsonRpcRequestJsonrpcTwo0,
    Method: "method",
}
client.A2A.SendTask(
    context.TODO(),
    "handle",
    request,
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

**handle:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**jsonrpc:** `*_go.A2AJsonRpcRequestJsonrpc` 
    
</dd>
</dl>

<dl>
<dd>

**id:** `*_go.A2AJsonRpcRequestId` 
    
</dd>
</dl>

<dl>
<dd>

**method:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**params:** `map[string]any` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.A2A.GetAgentCard(Handle) -> *_go.A2AAgentCard</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.A2A.GetAgentCard(
    context.TODO(),
    "handle",
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

**handle:** `string` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.A2A.UpdateTask(TaskID, request) -> *_go.UpdateTaskA2AResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.A2ATaskUpdate{
    State: _go.A2ATaskUpdateStateTaskStateSubmitted,
}
client.A2A.UpdateTask(
    context.TODO(),
    "taskId",
    request,
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

**taskID:** `string` 
    
</dd>
</dl>

<dl>
<dd>

**state:** `*_go.A2ATaskUpdateState` 
    
</dd>
</dl>

<dl>
<dd>

**message:** `*_go.A2ATaskUpdateMessage` 
    
</dd>
</dl>

<dl>
<dd>

**artifacts:** `[]*_go.A2ATaskUpdateArtifactsItem` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.A2A.UpdateIdentity(request) -> map[string]any</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &_go.A2AIdentitySettings{}
client.A2A.UpdateIdentity(
    context.TODO(),
    request,
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

**publiclyDiscoverable:** `*bool` 
    
</dd>
</dl>

<dl>
<dd>

**admissionMode:** `*_go.A2AIdentitySettingsAdmissionMode` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `*string` 
    
</dd>
</dl>

<dl>
<dd>

**skills:** `[]*_go.A2AIdentitySettingsSkillsItem` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

