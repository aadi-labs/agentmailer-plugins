import Foundation

public final class BillingClient: Sendable {
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
    ///     _ = try await client.billing.get()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(requestOptions: RequestOptions? = nil) async throws -> GetBillingResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/billing",
            requestOptions: requestOptions,
            responseType: GetBillingResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.billing.createCheckout(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func createCheckout(request: Requests.BillingSelection, requestOptions: RequestOptions? = nil) async throws -> CreateCheckoutBillingResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/billing/checkout",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateCheckoutBillingResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.billing.createPortal()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func createPortal(requestOptions: RequestOptions? = nil) async throws -> CreatePortalBillingResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/billing/portal",
            requestOptions: requestOptions,
            responseType: CreatePortalBillingResponse.self
        )
    }
}