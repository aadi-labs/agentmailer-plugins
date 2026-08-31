import Foundation

public final class PodsClient: Sendable {
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
    ///     _ = try await client.pods.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(requestOptions: RequestOptions? = nil) async throws -> ListPodsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/pods",
            requestOptions: requestOptions,
            responseType: ListPodsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.pods.create(request: .init(name: "name"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.PodCreate, requestOptions: RequestOptions? = nil) async throws -> CreatePodsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/pods",
            body: request,
            requestOptions: requestOptions,
            responseType: CreatePodsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.pods.get(podId: "podId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(podId: String, requestOptions: RequestOptions? = nil) async throws -> GetPodsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/pods/\(podId)",
            requestOptions: requestOptions,
            responseType: GetPodsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.pods.delete(podId: "podId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(podId: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/v1/pods/\(podId)",
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
    ///     _ = try await client.pods.update(
    ///         podId: "podId",
    ///         request: .init(name: "name")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(podId: String, request: Requests.PodUpdate, requestOptions: RequestOptions? = nil) async throws -> UpdatePodsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/v1/pods/\(podId)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdatePodsResponse.self
        )
    }
}