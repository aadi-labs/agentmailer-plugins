import Foundation

public final class MessagesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List or search messages
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.messages.list(inboxId: "inboxId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(inboxId: String, limit: Int? = nil, pageToken: String? = nil, threadId: String? = nil, label: String? = nil, query: String? = nil, before: Date? = nil, after: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ListMessagesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/inboxes/\(inboxId)/messages",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "page_token": pageToken.map { .string($0) }, 
                "thread_id": threadId.map { .string($0) }, 
                "label": label.map { .string($0) }, 
                "query": query.map { .string($0) }, 
                "before": before.map { .date($0) }, 
                "after": after.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListMessagesResponse.self
        )
    }

    /// Send a message
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.messages.send(
    ///         inboxId: "inboxId",
    ///         idempotencyKey: "Idempotency-Key",
    ///         request: MessageCompose(
    ///             to: [
    ///                 MessageComposeToItem.string(
    ///                     "to"
    ///                 )
    ///             ]
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter idempotencyKey: Stable caller-generated key used to make retries safe without duplicating the operation.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func send(inboxId: String, idempotencyKey: String, request: MessageCompose, requestOptions: RequestOptions? = nil) async throws -> SendMessagesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/inboxes/\(inboxId)/messages/send",
            headers: [
                "Idempotency-Key": idempotencyKey
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: SendMessagesResponse.self
        )
    }

    /// Get a message
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.messages.get(
    ///         inboxId: "inboxId",
    ///         messageId: "messageId"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(inboxId: String, messageId: String, requestOptions: RequestOptions? = nil) async throws -> GetMessagesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/inboxes/\(inboxId)/messages/\(messageId)",
            requestOptions: requestOptions,
            responseType: GetMessagesResponse.self
        )
    }

    /// Delete a message
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.messages.delete(
    ///         inboxId: "inboxId",
    ///         messageId: "messageId"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(inboxId: String, messageId: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/v1/inboxes/\(inboxId)/messages/\(messageId)",
            requestOptions: requestOptions
        )
    }

    /// Reply to a message
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.messages.reply(
    ///         inboxId: "inboxId",
    ///         messageId: "messageId",
    ///         idempotencyKey: "Idempotency-Key",
    ///         request: ReplyCompose(
    ///
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter idempotencyKey: Stable caller-generated key used to make retries safe without duplicating the operation.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func reply(inboxId: String, messageId: String, idempotencyKey: String, request: ReplyCompose, requestOptions: RequestOptions? = nil) async throws -> ReplyMessagesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/inboxes/\(inboxId)/messages/\(messageId)/reply",
            headers: [
                "Idempotency-Key": idempotencyKey
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: ReplyMessagesResponse.self
        )
    }

    /// Reply all to a message
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.messages.replyAll(
    ///         inboxId: "inboxId",
    ///         messageId: "messageId",
    ///         idempotencyKey: "Idempotency-Key",
    ///         request: ReplyCompose(
    ///
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter idempotencyKey: Stable caller-generated key used to make retries safe without duplicating the operation.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func replyAll(inboxId: String, messageId: String, idempotencyKey: String, request: ReplyCompose, requestOptions: RequestOptions? = nil) async throws -> ReplyAllMessagesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/inboxes/\(inboxId)/messages/\(messageId)/reply-all",
            headers: [
                "Idempotency-Key": idempotencyKey
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: ReplyAllMessagesResponse.self
        )
    }

    /// Forward a message
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.messages.forward(
    ///         inboxId: "inboxId",
    ///         messageId: "messageId",
    ///         idempotencyKey: "Idempotency-Key",
    ///         request: MessageCompose(
    ///             to: [
    ///                 MessageComposeToItem.string(
    ///                     "to"
    ///                 )
    ///             ]
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter idempotencyKey: Stable caller-generated key used to make retries safe without duplicating the operation.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func forward(inboxId: String, messageId: String, idempotencyKey: String, request: MessageCompose, requestOptions: RequestOptions? = nil) async throws -> ForwardMessagesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/inboxes/\(inboxId)/messages/\(messageId)/forward",
            headers: [
                "Idempotency-Key": idempotencyKey
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: ForwardMessagesResponse.self
        )
    }
}