import Foundation

public final class LabelsClient: Sendable {
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
    ///     _ = try await client.labels.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(podId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListLabelsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/labels",
            queryParams: [
                "pod_id": podId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListLabelsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.labels.create(request: .init(
    ///         podId: "podId",
    ///         name: "name"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.LabelCreate, requestOptions: RequestOptions? = nil) async throws -> CreateLabelsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/labels",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateLabelsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.labels.delete(labelId: "labelId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(labelId: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/v1/labels/\(labelId)",
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
    ///     _ = try await client.labels.updateMessage(
    ///         messageId: "messageId",
    ///         request: LabelMutation(
    ///
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func updateMessage(messageId: String, request: LabelMutation, requestOptions: RequestOptions? = nil) async throws -> UpdateMessageLabelsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/v1/messages/\(messageId)/labels",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateMessageLabelsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.labels.updateThread(
    ///         threadId: "threadId",
    ///         request: LabelMutation(
    ///
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func updateThread(threadId: String, request: LabelMutation, requestOptions: RequestOptions? = nil) async throws -> UpdateThreadLabelsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/v1/threads/\(threadId)/labels",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateThreadLabelsResponse.self
        )
    }
}