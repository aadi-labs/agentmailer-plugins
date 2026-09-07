import Foundation

public final class ChannelConversationsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List human-channel conversations
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.channelConversations.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(limit: Int? = nil, pageToken: String? = nil, endpointId: String? = nil, channel: ListChannelConversationsRequestChannel? = nil, status: ListChannelConversationsRequestStatus? = nil, requestOptions: RequestOptions? = nil) async throws -> ListChannelConversationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/channel-conversations",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "pageToken": pageToken.map { .string($0) }, 
                "endpointId": endpointId.map { .string($0) }, 
                "channel": channel.map { .string($0.rawValue) }, 
                "status": status.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListChannelConversationsResponse.self
        )
    }

    /// Get a human-channel conversation
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.channelConversations.get(conversationId: "conversationId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(conversationId: String, requestOptions: RequestOptions? = nil) async throws -> GetChannelConversationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/channel-conversations/\(conversationId)",
            requestOptions: requestOptions,
            responseType: GetChannelConversationsResponse.self
        )
    }

    /// Open or close a human-channel conversation
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.channelConversations.update(
    ///         conversationId: "conversationId",
    ///         request: .init(status: .active)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(conversationId: String, request: Requests.ChannelConversationUpdate, requestOptions: RequestOptions? = nil) async throws -> UpdateChannelConversationsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/v1/channel-conversations/\(conversationId)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateChannelConversationsResponse.self
        )
    }
}