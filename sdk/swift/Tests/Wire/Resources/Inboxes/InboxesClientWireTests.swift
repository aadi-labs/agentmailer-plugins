import Foundation
import Testing
import AgentMailer

@Suite("InboxesClient Wire Tests") struct InboxesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "inboxes": [
                    {
                      "id": "id",
                      "podId": "podId",
                      "address": "address",
                      "displayName": "displayName",
                      "clientId": "clientId",
                      "metadata": {
                        "key": "value"
                      },
                      "status": "provisioning",
                      "createdAt": "2024-01-15T09:30:00Z",
                      "updatedAt": "2024-01-15T09:30:00Z"
                    }
                  ],
                  "nextPageToken": "nextPageToken"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListInboxesResponse(
            inboxes: [
                Inbox(
                    id: "id",
                    podId: "podId",
                    address: "address",
                    displayName: Nullable<String>.value("displayName"),
                    clientId: Nullable<String>.value("clientId"),
                    metadata: [
                        "key": InboxMetadataValue.string(
                            "value"
                        )
                    ],
                    status: InboxStatus.provisioning,
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ],
            nextPageToken: Optional("nextPageToken")
        )
        let response = try await client.inboxes.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "inboxes": [
                    {
                      "id": "id",
                      "podId": "podId",
                      "address": "address",
                      "displayName": "displayName",
                      "clientId": "clientId",
                      "metadata": {
                        "metadata": "metadata"
                      },
                      "status": "provisioning",
                      "createdAt": "2024-01-15T09:30:00Z",
                      "updatedAt": "2024-01-15T09:30:00Z"
                    },
                    {
                      "id": "id",
                      "podId": "podId",
                      "address": "address",
                      "displayName": "displayName",
                      "clientId": "clientId",
                      "metadata": {
                        "metadata": "metadata"
                      },
                      "status": "provisioning",
                      "createdAt": "2024-01-15T09:30:00Z",
                      "updatedAt": "2024-01-15T09:30:00Z"
                    }
                  ],
                  "nextPageToken": "nextPageToken"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListInboxesResponse(
            inboxes: [
                Inbox(
                    id: "id",
                    podId: "podId",
                    address: "address",
                    displayName: Nullable<String>.value("displayName"),
                    clientId: Nullable<String>.value("clientId"),
                    metadata: [
                        "metadata": InboxMetadataValue.string(
                            "metadata"
                        )
                    ],
                    status: InboxStatus.provisioning,
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                ),
                Inbox(
                    id: "id",
                    podId: "podId",
                    address: "address",
                    displayName: Nullable<String>.value("displayName"),
                    clientId: Nullable<String>.value("clientId"),
                    metadata: [
                        "metadata": InboxMetadataValue.string(
                            "metadata"
                        )
                    ],
                    status: InboxStatus.provisioning,
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ],
            nextPageToken: Optional("nextPageToken")
        )
        let response = try await client.inboxes.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "inbox": {
                    "id": "id",
                    "podId": "podId",
                    "address": "address",
                    "displayName": "displayName",
                    "clientId": "clientId",
                    "metadata": {
                      "key": "value"
                    },
                    "status": "provisioning",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "updatedAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = CreateInboxesResponse(
            inbox: Inbox(
                id: "id",
                podId: "podId",
                address: "address",
                displayName: Nullable<String>.value("displayName"),
                clientId: Nullable<String>.value("clientId"),
                metadata: [
                    "key": InboxMetadataValue.string(
                        "value"
                    )
                ],
                status: InboxStatus.provisioning,
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.inboxes.create(
            request: .init(),
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
                  "inbox": {
                    "id": "id",
                    "podId": "podId",
                    "address": "address",
                    "displayName": "displayName",
                    "clientId": "clientId",
                    "metadata": {
                      "metadata": "metadata"
                    },
                    "status": "provisioning",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "updatedAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = CreateInboxesResponse(
            inbox: Inbox(
                id: "id",
                podId: "podId",
                address: "address",
                displayName: Nullable<String>.value("displayName"),
                clientId: Nullable<String>.value("clientId"),
                metadata: [
                    "metadata": InboxMetadataValue.string(
                        "metadata"
                    )
                ],
                status: InboxStatus.provisioning,
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.inboxes.create(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func get1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "inbox": {
                    "id": "id",
                    "podId": "podId",
                    "address": "address",
                    "displayName": "displayName",
                    "clientId": "clientId",
                    "metadata": {
                      "key": "value"
                    },
                    "status": "provisioning",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "updatedAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = GetInboxesResponse(
            inbox: Inbox(
                id: "id",
                podId: "podId",
                address: "address",
                displayName: Nullable<String>.value("displayName"),
                clientId: Nullable<String>.value("clientId"),
                metadata: [
                    "key": InboxMetadataValue.string(
                        "value"
                    )
                ],
                status: InboxStatus.provisioning,
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.inboxes.get(
            inboxId: "inboxId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func get2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "inbox": {
                    "id": "id",
                    "podId": "podId",
                    "address": "address",
                    "displayName": "displayName",
                    "clientId": "clientId",
                    "metadata": {
                      "metadata": "metadata"
                    },
                    "status": "provisioning",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "updatedAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = GetInboxesResponse(
            inbox: Inbox(
                id: "id",
                podId: "podId",
                address: "address",
                displayName: Nullable<String>.value("displayName"),
                clientId: Nullable<String>.value("clientId"),
                metadata: [
                    "metadata": InboxMetadataValue.string(
                        "metadata"
                    )
                ],
                status: InboxStatus.provisioning,
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.inboxes.get(
            inboxId: "inboxId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "inbox": {
                    "id": "id",
                    "podId": "podId",
                    "address": "address",
                    "displayName": "displayName",
                    "clientId": "clientId",
                    "metadata": {
                      "key": "value"
                    },
                    "status": "provisioning",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "updatedAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = UpdateInboxesResponse(
            inbox: Inbox(
                id: "id",
                podId: "podId",
                address: "address",
                displayName: Nullable<String>.value("displayName"),
                clientId: Nullable<String>.value("clientId"),
                metadata: [
                    "key": InboxMetadataValue.string(
                        "value"
                    )
                ],
                status: InboxStatus.provisioning,
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.inboxes.update(
            inboxId: "inboxId",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "inbox": {
                    "id": "id",
                    "podId": "podId",
                    "address": "address",
                    "displayName": "displayName",
                    "clientId": "clientId",
                    "metadata": {
                      "metadata": "metadata"
                    },
                    "status": "provisioning",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "updatedAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = UpdateInboxesResponse(
            inbox: Inbox(
                id: "id",
                podId: "podId",
                address: "address",
                displayName: Nullable<String>.value("displayName"),
                clientId: Nullable<String>.value("clientId"),
                metadata: [
                    "metadata": InboxMetadataValue.string(
                        "metadata"
                    )
                ],
                status: InboxStatus.provisioning,
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.inboxes.update(
            inboxId: "inboxId",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func issueCredentials1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "username": "username",
                  "password": "password",
                  "imap": {
                    "host": "host",
                    "port": 1,
                    "security": "tls"
                  },
                  "smtp": {
                    "host": "host",
                    "port": 1,
                    "security": "tls"
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
        let expectedResponse = IssueCredentialsInboxesResponse(
            username: "username",
            password: "password",
            imap: MailProtocolEndpoint(
                host: "host",
                port: 1,
                security: MailProtocolEndpointSecurity.tls
            ),
            smtp: MailProtocolEndpoint(
                host: "host",
                port: 1,
                security: MailProtocolEndpointSecurity.tls
            )
        )
        let response = try await client.inboxes.issueCredentials(
            inboxId: "inboxId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func issueCredentials2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "username": "username",
                  "password": "password",
                  "imap": {
                    "host": "host",
                    "port": 65535,
                    "security": "tls"
                  },
                  "smtp": {
                    "host": "host",
                    "port": 65535,
                    "security": "tls"
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
        let expectedResponse = IssueCredentialsInboxesResponse(
            username: "username",
            password: "password",
            imap: MailProtocolEndpoint(
                host: "host",
                port: 65535,
                security: MailProtocolEndpointSecurity.tls
            ),
            smtp: MailProtocolEndpoint(
                host: "host",
                port: 65535,
                security: MailProtocolEndpointSecurity.tls
            )
        )
        let response = try await client.inboxes.issueCredentials(
            inboxId: "inboxId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}