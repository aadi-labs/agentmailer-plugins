import Foundation

public final class DraftsClient: Sendable {
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
    ///     _ = try await client.drafts.list(inboxId: "inboxId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(inboxId: String, requestOptions: RequestOptions? = nil) async throws -> ListDraftsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/inboxes/\(inboxId)/drafts",
            requestOptions: requestOptions,
            responseType: ListDraftsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.drafts.create(
    ///         inboxId: "inboxId",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(inboxId: String, request: Requests.DraftCreate, requestOptions: RequestOptions? = nil) async throws -> CreateDraftsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/inboxes/\(inboxId)/drafts",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateDraftsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.drafts.get(
    ///         inboxId: "inboxId",
    ///         draftId: "draftId"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(inboxId: String, draftId: String, requestOptions: RequestOptions? = nil) async throws -> GetDraftsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/inboxes/\(inboxId)/drafts/\(draftId)",
            requestOptions: requestOptions,
            responseType: GetDraftsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.drafts.delete(
    ///         inboxId: "inboxId",
    ///         draftId: "draftId"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(inboxId: String, draftId: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/v1/inboxes/\(inboxId)/drafts/\(draftId)",
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
    ///     _ = try await client.drafts.update(
    ///         inboxId: "inboxId",
    ///         draftId: "draftId",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(inboxId: String, draftId: String, request: Requests.DraftUpdate, requestOptions: RequestOptions? = nil) async throws -> UpdateDraftsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/v1/inboxes/\(inboxId)/drafts/\(draftId)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateDraftsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.drafts.send(
    ///         inboxId: "inboxId",
    ///         draftId: "draftId"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func send(inboxId: String, draftId: String, requestOptions: RequestOptions? = nil) async throws -> SendDraftsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/inboxes/\(inboxId)/drafts/\(draftId)/send",
            requestOptions: requestOptions,
            responseType: SendDraftsResponse.self
        )
    }
}