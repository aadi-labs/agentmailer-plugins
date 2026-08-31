import Foundation
import Testing
import AgentMailer

@Suite("LabelsClient Wire Tests") struct LabelsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "labels": [
                    {
                      "podId": "podId",
                      "name": "name",
                      "color": "color",
                      "id": "id",
                      "createdAt": "2024-01-15T09:30:00Z"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListLabelsResponse(
            labels: [
                Label(
                    podId: "podId",
                    name: "name",
                    color: Optional("color"),
                    id: "id",
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ]
        )
        let response = try await client.labels.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "labels": [
                    {
                      "podId": "podId",
                      "name": "x",
                      "color": "color",
                      "id": "id",
                      "createdAt": "2024-01-15T09:30:00Z"
                    },
                    {
                      "podId": "podId",
                      "name": "x",
                      "color": "color",
                      "id": "id",
                      "createdAt": "2024-01-15T09:30:00Z"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListLabelsResponse(
            labels: [
                Label(
                    podId: "podId",
                    name: "x",
                    color: Optional("color"),
                    id: "id",
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                ),
                Label(
                    podId: "podId",
                    name: "x",
                    color: Optional("color"),
                    id: "id",
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ]
        )
        let response = try await client.labels.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "label": {
                    "podId": "podId",
                    "name": "name",
                    "color": "color",
                    "id": "id",
                    "createdAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = CreateLabelsResponse(
            label: Label(
                podId: "podId",
                name: "name",
                color: Optional("color"),
                id: "id",
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.labels.create(
            request: .init(
                podId: "podId",
                name: "name"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "label": {
                    "podId": "podId",
                    "name": "x",
                    "color": "color",
                    "id": "id",
                    "createdAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = CreateLabelsResponse(
            label: Label(
                podId: "podId",
                name: "x",
                color: Optional("color"),
                id: "id",
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.labels.create(
            request: .init(
                podId: "podId",
                name: "x"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updateMessage1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "labels": [
                    "labels"
                  ]
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UpdateMessageLabelsResponse(
            labels: [
                "labels"
            ]
        )
        let response = try await client.labels.updateMessage(
            messageId: "messageId",
            request: LabelMutation(

            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updateMessage2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "labels": [
                    "labels",
                    "labels"
                  ]
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UpdateMessageLabelsResponse(
            labels: [
                "labels",
                "labels"
            ]
        )
        let response = try await client.labels.updateMessage(
            messageId: "messageId",
            request: LabelMutation(

            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updateThread1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "labels": [
                    "labels"
                  ]
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UpdateThreadLabelsResponse(
            labels: [
                "labels"
            ]
        )
        let response = try await client.labels.updateThread(
            threadId: "threadId",
            request: LabelMutation(

            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updateThread2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "labels": [
                    "labels",
                    "labels"
                  ]
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UpdateThreadLabelsResponse(
            labels: [
                "labels",
                "labels"
            ]
        )
        let response = try await client.labels.updateThread(
            threadId: "threadId",
            request: LabelMutation(

            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}