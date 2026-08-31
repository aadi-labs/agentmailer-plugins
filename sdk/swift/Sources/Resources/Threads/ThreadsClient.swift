import Foundation

public final class ThreadsClient: Sendable {
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
    ///     _ = try await client.threads.list(inboxId: "inboxId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(inboxId: String, limit: Int? = nil, pageToken: String? = nil, label: String? = nil, query: String? = nil, before: Date? = nil, after: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ListThreadsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/inboxes/\(inboxId)/threads",
            queryParams: [
                "limit": limit.map { .int($0) }, 
                "page_token": pageToken.map { .string($0) }, 
                "label": label.map { .string($0) }, 
                "query": query.map { .string($0) }, 
                "before": before.map { .date($0) }, 
                "after": after.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListThreadsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.threads.get(
    ///         inboxId: "inboxId",
    ///         threadId: "threadId"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(inboxId: String, threadId: String, requestOptions: RequestOptions? = nil) async throws -> GetThreadsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/inboxes/\(inboxId)/threads/\(threadId)",
            requestOptions: requestOptions,
            responseType: GetThreadsResponse.self
        )
    }
}