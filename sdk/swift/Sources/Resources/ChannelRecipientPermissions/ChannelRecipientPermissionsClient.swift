import Foundation

public final class ChannelRecipientPermissionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List human-channel consent and opt-out state
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.channelRecipientPermissions.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(limit: Int? = nil, pageToken: String? = nil, endpointId: String? = nil, channel: ListChannelRecipientPermissionsRequestChannel? = nil, status: ListChannelRecipientPermissionsRequestStatus? = nil, requestOptions: RequestOptions? = nil) async throws -> ListChannelRecipientPermissionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/channel-recipient-permissions",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "pageToken": pageToken.map { .string($0) }, 
                "endpointId": endpointId.map { .string($0) }, 
                "channel": channel.map { .string($0.rawValue) }, 
                "status": status.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListChannelRecipientPermissionsResponse.self
        )
    }
}