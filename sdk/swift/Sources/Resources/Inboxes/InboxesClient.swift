import Foundation

public final class InboxesClient: Sendable {
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
    ///     _ = try await client.inboxes.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(limit: Int? = nil, pageToken: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListInboxesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/inboxes",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "page_token": pageToken.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListInboxesResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.inboxes.create(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.InboxCreate, requestOptions: RequestOptions? = nil) async throws -> CreateInboxesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/inboxes",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateInboxesResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.inboxes.get(inboxId: "inboxId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(inboxId: String, requestOptions: RequestOptions? = nil) async throws -> GetInboxesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/inboxes/\(inboxId)",
            requestOptions: requestOptions,
            responseType: GetInboxesResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.inboxes.delete(inboxId: "inboxId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(inboxId: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/v1/inboxes/\(inboxId)",
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
    ///     _ = try await client.inboxes.update(
    ///         inboxId: "inboxId",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(inboxId: String, request: Requests.InboxUpdate, requestOptions: RequestOptions? = nil) async throws -> UpdateInboxesResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/v1/inboxes/\(inboxId)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateInboxesResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.inboxes.issueCredentials(inboxId: "inboxId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func issueCredentials(inboxId: String, requestOptions: RequestOptions? = nil) async throws -> IssueCredentialsInboxesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/inboxes/\(inboxId)/credentials",
            requestOptions: requestOptions,
            responseType: IssueCredentialsInboxesResponse.self
        )
    }
}