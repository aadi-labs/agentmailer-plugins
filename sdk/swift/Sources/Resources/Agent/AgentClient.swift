import Foundation

public final class AgentClient: Sendable {
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
    ///     _ = try await client.agent.bootstrap(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bootstrap(request: Requests.BootstrapRequest, requestOptions: RequestOptions? = nil) async throws -> BootstrapResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/agent/bootstrap",
            body: request,
            requestOptions: requestOptions,
            responseType: BootstrapResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.agent.signUp(request: .init(
    ///         humanEmail: "human_email",
    ///         username: "username"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func signUp(request: Requests.SignUpAgentRequest, requestOptions: RequestOptions? = nil) async throws -> SignUpAgentResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/agent/sign-up",
            body: request,
            requestOptions: requestOptions,
            responseType: SignUpAgentResponse.self
        )
    }
}