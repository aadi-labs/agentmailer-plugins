import Foundation

public final class WebhooksClient: Sendable {
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
    ///     _ = try await client.webhooks.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(requestOptions: RequestOptions? = nil) async throws -> ListWebhooksResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/webhooks",
            requestOptions: requestOptions,
            responseType: ListWebhooksResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.webhooks.create(request: .init(url: "url"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.WebhookCreate, requestOptions: RequestOptions? = nil) async throws -> CreateWebhooksResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/webhooks",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateWebhooksResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.webhooks.get(webhookId: "webhookId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(webhookId: String, requestOptions: RequestOptions? = nil) async throws -> GetWebhooksResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/webhooks/\(webhookId)",
            requestOptions: requestOptions,
            responseType: GetWebhooksResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.webhooks.delete(webhookId: "webhookId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(webhookId: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/v1/webhooks/\(webhookId)",
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
    ///     _ = try await client.webhooks.update(
    ///         webhookId: "webhookId",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(webhookId: String, request: Requests.WebhookUpdate, requestOptions: RequestOptions? = nil) async throws -> UpdateWebhooksResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/v1/webhooks/\(webhookId)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateWebhooksResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.webhooks.rotateSecret(webhookId: "webhookId")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func rotateSecret(webhookId: String, requestOptions: RequestOptions? = nil) async throws -> RotateSecretWebhooksResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/webhooks/\(webhookId)/rotate-secret",
            requestOptions: requestOptions,
            responseType: RotateSecretWebhooksResponse.self
        )
    }
}