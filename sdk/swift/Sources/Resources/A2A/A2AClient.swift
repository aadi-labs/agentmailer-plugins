import Foundation

public final class A2AClient: Sendable {
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
    ///     _ = try await client.a2A.sendTask(
    ///         handle: "handle",
    ///         request: .init(
    ///             jsonrpc: .two0,
    ///             id: .null,
    ///             method: "method"
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func sendTask(handle: String, request: Requests.A2AJsonRpcRequest, requestOptions: RequestOptions? = nil) async throws -> [String: JSONValue] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/a2a/\(handle)",
            body: request,
            requestOptions: requestOptions,
            responseType: [String: JSONValue].self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.a2A.getAgentCard(handle: "handle")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getAgentCard(handle: String, requestOptions: RequestOptions? = nil) async throws -> A2AAgentCard {
        return try await httpClient.performRequest(
            method: .get,
            path: "/a2a/\(handle)/.well-known/agent-card.json",
            requestOptions: requestOptions,
            responseType: A2AAgentCard.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.a2A.updateTask(
    ///         taskId: "taskId",
    ///         request: .init(state: .taskStateSubmitted)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func updateTask(taskId: String, request: Requests.A2ATaskUpdate, requestOptions: RequestOptions? = nil) async throws -> UpdateTaskA2AResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/a2a/tasks/\(taskId)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateTaskA2AResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.a2A.updateIdentity(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func updateIdentity(request: Requests.A2AIdentitySettings, requestOptions: RequestOptions? = nil) async throws -> [String: JSONValue] {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/v1/a2a/identity",
            body: request,
            requestOptions: requestOptions,
            responseType: [String: JSONValue].self
        )
    }
}