import Foundation

public final class ListsClient: Sendable {
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
    ///     _ = try await client.lists.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(podId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListListsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/lists",
            queryParams: [
                "pod_id": podId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListListsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.lists.create(request: .init(
    ///         podId: "podId",
    ///         name: "name",
    ///         kind: .allow
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.ListCreate, requestOptions: RequestOptions? = nil) async throws -> CreateListsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/lists",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateListsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.lists.delete(listId: "listId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(listId: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/v1/lists/\(listId)",
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
    ///     _ = try await client.lists.addEntry(
    ///         listId: "listId",
    ///         request: .init(addressPattern: "addressPattern")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func addEntry(listId: String, request: Requests.ListEntry, requestOptions: RequestOptions? = nil) async throws -> AddEntryListsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/lists/\(listId)/entries",
            body: request,
            requestOptions: requestOptions,
            responseType: AddEntryListsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.lists.removeEntry(listId: "listId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func removeEntry(listId: String, addressPattern: String? = nil, requestOptions: RequestOptions? = nil) async throws -> RemoveEntryListsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/v1/lists/\(listId)/entries",
            queryParams: [
                "address_pattern": addressPattern.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: RemoveEntryListsResponse.self
        )
    }
}