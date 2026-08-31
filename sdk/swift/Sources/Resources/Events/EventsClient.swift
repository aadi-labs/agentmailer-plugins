import Foundation

public final class EventsClient: Sendable {
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
    ///     _ = try await client.events.createTicket(request: .init(podId: "podId"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func createTicket(request: Requests.CreateTicketEventsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateTicketEventsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/events/tickets",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateTicketEventsResponse.self
        )
    }
}