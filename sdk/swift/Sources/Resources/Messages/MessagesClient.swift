import Foundation

public final class MessagesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

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

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.messages.send(
    ///         inboxId: "inboxId",
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
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func send(inboxId: String, request: MessageCompose, requestOptions: RequestOptions? = nil) async throws -> SendMessagesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/inboxes/\(inboxId)/messages/send",
            body: request,
            requestOptions: requestOptions,
            responseType: SendMessagesResponse.self
        )
    }

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
    ///         request: ReplyCompose(
    ///
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func reply(inboxId: String, messageId: String, request: ReplyCompose, requestOptions: RequestOptions? = nil) async throws -> ReplyMessagesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/inboxes/\(inboxId)/messages/\(messageId)/reply",
            body: request,
            requestOptions: requestOptions,
            responseType: ReplyMessagesResponse.self
        )
    }

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
    ///         request: ReplyCompose(
    ///
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func replyAll(inboxId: String, messageId: String, request: ReplyCompose, requestOptions: RequestOptions? = nil) async throws -> ReplyAllMessagesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/inboxes/\(inboxId)/messages/\(messageId)/reply-all",
            body: request,
            requestOptions: requestOptions,
            responseType: ReplyAllMessagesResponse.self
        )
    }

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
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func forward(inboxId: String, messageId: String, request: MessageCompose, requestOptions: RequestOptions? = nil) async throws -> ForwardMessagesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/inboxes/\(inboxId)/messages/\(messageId)/forward",
            body: request,
            requestOptions: requestOptions,
            responseType: ForwardMessagesResponse.self
        )
    }
}