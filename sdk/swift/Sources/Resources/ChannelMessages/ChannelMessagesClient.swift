import Foundation

public final class ChannelMessagesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List human-channel messages
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.channelMessages.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(limit: Int? = nil, pageToken: String? = nil, endpointId: String? = nil, conversationId: String? = nil, channel: ListChannelMessagesRequestChannel? = nil, requestOptions: RequestOptions? = nil) async throws -> ListChannelMessagesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/channel-messages",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "pageToken": pageToken.map { .string($0) }, 
                "endpointId": endpointId.map { .string($0) }, 
                "conversationId": conversationId.map { .string($0) }, 
                "channel": channel.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListChannelMessagesResponse.self
        )
    }

    /// Sends through an assigned SMS, MMS, RCS, WhatsApp, or outbound voice endpoint. Supports RCS rich cards and replies, plus WhatsApp media and reply buttons. All non-template WhatsApp messages require a recipient message within the last 24 hours; otherwise use an approved template.
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.channelMessages.send(
    ///         idempotencyKey: "Idempotency-Key",
    ///         request: ChannelMessageSend.sms(
    ///             ChannelMessageSendSms(
    ///                 endpointId: "endpointId",
    ///                 to: "to",
    ///                 consent: ChannelMessageSendSmsConsent(
    ///                     basis: .explicit,
    ///                     capturedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
    ///                     reference: "reference"
    ///                 ),
    ///                 content: ChannelMessageSendSmsContent(
    ///                     type: .text,
    ///                     body: "body"
    ///                 )
    ///             )
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter idempotencyKey: Stable caller-generated key used to make retries safe without duplicating the operation.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func send(idempotencyKey: String, request: ChannelMessageSend, requestOptions: RequestOptions? = nil) async throws -> SendChannelMessagesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/channel-messages",
            headers: [
                "Idempotency-Key": idempotencyKey
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: SendChannelMessagesResponse.self
        )
    }
}