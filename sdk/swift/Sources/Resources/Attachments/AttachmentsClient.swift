import Foundation

public final class AttachmentsClient: Sendable {
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
    ///     _ = try await client.attachments.upload(
    ///         inboxId: "inboxId",
    ///         request: .init(
    ///             filename: "filename",
    ///             contentType: "contentType",
    ///             size: 1,
    ///             checksumSha256: "checksumSha256"
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func upload(inboxId: String, request: Requests.AttachmentUploadCreate, requestOptions: RequestOptions? = nil) async throws -> [String: JSONValue] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/inboxes/\(inboxId)/attachments",
            body: request,
            requestOptions: requestOptions,
            responseType: [String: JSONValue].self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.attachments.complete(
    ///         inboxId: "inboxId",
    ///         attachmentId: "attachmentId"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func complete(inboxId: String, attachmentId: String, requestOptions: RequestOptions? = nil) async throws -> CompleteAttachmentsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1/inboxes/\(inboxId)/attachments/\(attachmentId)/complete",
            requestOptions: requestOptions,
            responseType: CompleteAttachmentsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import AgentMailer
    ///
    /// private func main() async throws {
    ///     let client = AgentMailer(apiKey: "<token>")
    ///
    ///     _ = try await client.attachments.download(
    ///         inboxId: "inboxId",
    ///         attachmentId: "attachmentId"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func download(inboxId: String, attachmentId: String, requestOptions: RequestOptions? = nil) async throws -> DownloadAttachmentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1/inboxes/\(inboxId)/attachments/\(attachmentId)/download",
            requestOptions: requestOptions,
            responseType: DownloadAttachmentsResponse.self
        )
    }
}