import Foundation

public final class DomainsClient: Sendable {
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
    ///     _ = try await client.domains.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(requestOptions: RequestOptions? = nil) async throws -> ListDomainsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/domains",
            requestOptions: requestOptions,
            responseType: ListDomainsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.domains.create(request: .init(domain: "domain"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.DomainCreate, requestOptions: RequestOptions? = nil) async throws -> CreateDomainsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/domains",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateDomainsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.domains.get(domainId: "domainId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(domainId: String, requestOptions: RequestOptions? = nil) async throws -> GetDomainsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/domains/\(domainId)",
            requestOptions: requestOptions,
            responseType: GetDomainsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.domains.delete(domainId: "domainId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(domainId: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/v1/domains/\(domainId)",
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
    ///     _ = try await client.domains.verify(domainId: "domainId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func verify(domainId: String, requestOptions: RequestOptions? = nil) async throws -> VerifyDomainsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/domains/\(domainId)/verify",
            requestOptions: requestOptions,
            responseType: VerifyDomainsResponse.self
        )
    }
}