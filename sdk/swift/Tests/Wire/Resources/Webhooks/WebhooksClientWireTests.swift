import Foundation
import Testing
import AgentMailer

@Suite("WebhooksClient Wire Tests") struct WebhooksClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "webhooks": [
                    {
                      "url": "url",
                      "podId": "podId",
                      "inboxId": "inboxId",
                      "eventTypes": [
                        "inbox.provisioning"
                      ],
                      "description": "description",
                      "id": "id",
                      "status": "enabled",
                      "createdAt": "2024-01-15T09:30:00Z",
                      "updatedAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = ListWebhooksResponse(
            webhooks: [
                Webhook(
                    url: "url",
                    podId: Optional("podId"),
                    inboxId: Optional("inboxId"),
                    eventTypes: [
                        WebhookEventTypesItem.inboxProvisioning
                    ],
                    description: Optional("description"),
                    id: "id",
                    status: WebhookStatus.enabled,
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ]
        )
        let response = try await client.webhooks.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "webhooks": [
                    {
                      "url": "url",
                      "podId": "podId",
                      "inboxId": "inboxId",
                      "eventTypes": [
                        "inbox.provisioning",
                        "inbox.provisioning"
                      ],
                      "description": "description",
                      "id": "id",
                      "status": "enabled",
                      "createdAt": "2024-01-15T09:30:00Z",
                      "updatedAt": "2024-01-15T09:30:00Z"
                    },
                    {
                      "url": "url",
                      "podId": "podId",
                      "inboxId": "inboxId",
                      "eventTypes": [
                        "inbox.provisioning",
                        "inbox.provisioning"
                      ],
                      "description": "description",
                      "id": "id",
                      "status": "enabled",
                      "createdAt": "2024-01-15T09:30:00Z",
                      "updatedAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = ListWebhooksResponse(
            webhooks: [
                Webhook(
                    url: "url",
                    podId: Optional("podId"),
                    inboxId: Optional("inboxId"),
                    eventTypes: [
                        WebhookEventTypesItem.inboxProvisioning,
                        WebhookEventTypesItem.inboxProvisioning
                    ],
                    description: Optional("description"),
                    id: "id",
                    status: WebhookStatus.enabled,
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                ),
                Webhook(
                    url: "url",
                    podId: Optional("podId"),
                    inboxId: Optional("inboxId"),
                    eventTypes: [
                        WebhookEventTypesItem.inboxProvisioning,
                        WebhookEventTypesItem.inboxProvisioning
                    ],
                    description: Optional("description"),
                    id: "id",
                    status: WebhookStatus.enabled,
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ]
        )
        let response = try await client.webhooks.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "webhook": {
                    "url": "url",
                    "podId": "podId",
                    "inboxId": "inboxId",
                    "eventTypes": [
                      "inbox.provisioning"
                    ],
                    "description": "description",
                    "id": "id",
                    "status": "enabled",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "updatedAt": "2024-01-15T09:30:00Z"
                  },
                  "secret": "secret"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateWebhooksResponse(
            webhook: Webhook(
                url: "url",
                podId: Optional("podId"),
                inboxId: Optional("inboxId"),
                eventTypes: [
                    WebhookEventTypesItem.inboxProvisioning
                ],
                description: Optional("description"),
                id: "id",
                status: WebhookStatus.enabled,
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            ),
            secret: "secret"
        )
        let response = try await client.webhooks.create(
            request: .init(url: "url"),
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
                  "webhook": {
                    "url": "url",
                    "podId": "podId",
                    "inboxId": "inboxId",
                    "eventTypes": [
                      "inbox.provisioning",
                      "inbox.provisioning"
                    ],
                    "description": "description",
                    "id": "id",
                    "status": "enabled",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "updatedAt": "2024-01-15T09:30:00Z"
                  },
                  "secret": "secret"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateWebhooksResponse(
            webhook: Webhook(
                url: "url",
                podId: Optional("podId"),
                inboxId: Optional("inboxId"),
                eventTypes: [
                    WebhookEventTypesItem.inboxProvisioning,
                    WebhookEventTypesItem.inboxProvisioning
                ],
                description: Optional("description"),
                id: "id",
                status: WebhookStatus.enabled,
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            ),
            secret: "secret"
        )
        let response = try await client.webhooks.create(
            request: .init(url: "url"),
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
                  "webhook": {
                    "url": "url",
                    "podId": "podId",
                    "inboxId": "inboxId",
                    "eventTypes": [
                      "inbox.provisioning"
                    ],
                    "description": "description",
                    "id": "id",
                    "status": "enabled",
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
        let expectedResponse = GetWebhooksResponse(
            webhook: Webhook(
                url: "url",
                podId: Optional("podId"),
                inboxId: Optional("inboxId"),
                eventTypes: [
                    WebhookEventTypesItem.inboxProvisioning
                ],
                description: Optional("description"),
                id: "id",
                status: WebhookStatus.enabled,
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.webhooks.get(
            webhookId: "webhookId",
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
                  "webhook": {
                    "url": "url",
                    "podId": "podId",
                    "inboxId": "inboxId",
                    "eventTypes": [
                      "inbox.provisioning",
                      "inbox.provisioning"
                    ],
                    "description": "description",
                    "id": "id",
                    "status": "enabled",
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
        let expectedResponse = GetWebhooksResponse(
            webhook: Webhook(
                url: "url",
                podId: Optional("podId"),
                inboxId: Optional("inboxId"),
                eventTypes: [
                    WebhookEventTypesItem.inboxProvisioning,
                    WebhookEventTypesItem.inboxProvisioning
                ],
                description: Optional("description"),
                id: "id",
                status: WebhookStatus.enabled,
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.webhooks.get(
            webhookId: "webhookId",
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
                  "webhook": {
                    "url": "url",
                    "podId": "podId",
                    "inboxId": "inboxId",
                    "eventTypes": [
                      "inbox.provisioning"
                    ],
                    "description": "description",
                    "id": "id",
                    "status": "enabled",
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
        let expectedResponse = UpdateWebhooksResponse(
            webhook: Webhook(
                url: "url",
                podId: Optional("podId"),
                inboxId: Optional("inboxId"),
                eventTypes: [
                    WebhookEventTypesItem.inboxProvisioning
                ],
                description: Optional("description"),
                id: "id",
                status: WebhookStatus.enabled,
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.webhooks.update(
            webhookId: "webhookId",
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
                  "webhook": {
                    "url": "url",
                    "podId": "podId",
                    "inboxId": "inboxId",
                    "eventTypes": [
                      "inbox.provisioning",
                      "inbox.provisioning"
                    ],
                    "description": "description",
                    "id": "id",
                    "status": "enabled",
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
        let expectedResponse = UpdateWebhooksResponse(
            webhook: Webhook(
                url: "url",
                podId: Optional("podId"),
                inboxId: Optional("inboxId"),
                eventTypes: [
                    WebhookEventTypesItem.inboxProvisioning,
                    WebhookEventTypesItem.inboxProvisioning
                ],
                description: Optional("description"),
                id: "id",
                status: WebhookStatus.enabled,
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.webhooks.update(
            webhookId: "webhookId",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func rotateSecret1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "secret": "secret"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RotateSecretWebhooksResponse(
            secret: "secret"
        )
        let response = try await client.webhooks.rotateSecret(
            webhookId: "webhookId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func rotateSecret2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "secret": "secret"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RotateSecretWebhooksResponse(
            secret: "secret"
        )
        let response = try await client.webhooks.rotateSecret(
            webhookId: "webhookId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}