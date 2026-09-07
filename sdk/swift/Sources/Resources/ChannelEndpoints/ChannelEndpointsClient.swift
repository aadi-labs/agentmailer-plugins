import Foundation

public final class ChannelEndpointsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List human-channel endpoints
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.channelEndpoints.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(requestOptions: RequestOptions? = nil) async throws -> ListChannelEndpointsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/channel-endpoints",
            requestOptions: requestOptions,
            responseType: ListChannelEndpointsResponse.self
        )
    }

    /// Assign a human-channel endpoint
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.channelEndpoints.create(request: .init(
    ///         inboxId: "inboxId",
    ///         podId: "podId",
    ///         channel: .sms
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.ChannelEndpointCreate, requestOptions: RequestOptions? = nil) async throws -> CreateChannelEndpointsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/channel-endpoints",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateChannelEndpointsResponse.self
        )
    }

    /// Get a human-channel endpoint
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.channelEndpoints.get(endpointId: "endpointId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(endpointId: String, requestOptions: RequestOptions? = nil) async throws -> GetChannelEndpointsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/channel-endpoints/\(endpointId)",
            requestOptions: requestOptions,
            responseType: GetChannelEndpointsResponse.self
        )
    }

    /// Enable or disable a human-channel endpoint
    ///
    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.channelEndpoints.update(
    ///         endpointId: "endpointId",
    ///         request: .init(status: .active)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(endpointId: String, request: Requests.ChannelEndpointUpdate, requestOptions: RequestOptions? = nil) async throws -> UpdateChannelEndpointsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/v1/channel-endpoints/\(endpointId)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateChannelEndpointsResponse.self
        )
    }
}