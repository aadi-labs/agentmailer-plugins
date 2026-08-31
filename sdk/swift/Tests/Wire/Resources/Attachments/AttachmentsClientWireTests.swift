import Foundation
import Testing
import AgentMailer

@Suite("AttachmentsClient Wire Tests") struct AttachmentsClientWireTests {
    @Test func upload1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "key": "value"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = [
            "key": JSONValue.string("value")
        ]
        let response = try await client.attachments.upload(
            inboxId: "inboxId",
            request: .init(
                filename: "filename",
                contentType: "contentType",
                size: 1,
                checksumSha256: "checksumSha256"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func upload2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "string": {
                    "key": "value"
                  }
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = [
            "string": JSONValue.object(
                [
                    "key": JSONValue.string("value")
                ]
            )
        ]
        let response = try await client.attachments.upload(
            inboxId: "inboxId",
            request: .init(
                filename: "x",
                contentType: "x",
                size: 31457280,
                checksumSha256: "checksumSha256"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func complete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachment": {
                    "id": "id",
                    "filename": "filename",
                    "contentType": "contentType",
                    "size": 1,
                    "status": "pending",
                    "expiresAt": "2024-01-15T09:30:00Z"
                  }
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CompleteAttachmentsResponse(
            attachment: Attachment(
                id: "id",
                filename: "filename",
                contentType: "contentType",
                size: 1,
                status: AttachmentStatus.pending,
                expiresAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))
            )
        )
        let response = try await client.attachments.complete(
            inboxId: "inboxId",
            attachmentId: "attachmentId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func complete2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachment": {
                    "id": "id",
                    "filename": "filename",
                    "contentType": "contentType",
                    "size": 1,
                    "status": "pending",
                    "expiresAt": "2024-01-15T09:30:00Z"
                  }
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CompleteAttachmentsResponse(
            attachment: Attachment(
                id: "id",
                filename: "filename",
                contentType: "contentType",
                size: 1,
                status: AttachmentStatus.pending,
                expiresAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))
            )
        )
        let response = try await client.attachments.complete(
            inboxId: "inboxId",
            attachmentId: "attachmentId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func download1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "url": "url",
                  "expiresAt": "2024-01-15T09:30:00Z"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DownloadAttachmentsResponse(
            url: "url",
            expiresAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
        )
        let response = try await client.attachments.download(
            inboxId: "inboxId",
            attachmentId: "attachmentId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func download2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "url": "url",
                  "expiresAt": "2024-01-15T09:30:00Z"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DownloadAttachmentsResponse(
            url: "url",
            expiresAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
        )
        let response = try await client.attachments.download(
            inboxId: "inboxId",
            attachmentId: "attachmentId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}