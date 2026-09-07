import Foundation
import Testing
import AgentMailer

@Suite("ChannelEndpointsClient Wire Tests") struct ChannelEndpointsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "endpoints": [
                    {
                      "id": "id",
                      "inboxId": "inboxId",
                      "podId": "podId",
                      "channel": "sms",
                      "address": "address",
                      "status": "provisioning",
                      "capabilities": [
                        "sms"
                      ],
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
        let expectedResponse = ListChannelEndpointsResponse(
            endpoints: [
                ChannelEndpoint(
                    id: "id",
                    inboxId: "inboxId",
                    podId: "podId",
                    channel: ChannelEndpointChannel.sms,
                    address: "address",
                    status: ChannelEndpointStatus.provisioning,
                    capabilities: [
                        ChannelEndpointCapabilitiesItem.sms
                    ],
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ]
        )
        let response = try await client.channelEndpoints.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "endpoints": [
                    {
                      "id": "id",
                      "inboxId": "inboxId",
                      "podId": "podId",
                      "channel": "sms",
                      "address": "x",
                      "status": "provisioning",
                      "capabilities": [
                        "sms",
                        "sms"
                      ],
                      "createdAt": "2024-01-15T09:30:00Z",
                      "updatedAt": "2024-01-15T09:30:00Z"
                    },
                    {
                      "id": "id",
                      "inboxId": "inboxId",
                      "podId": "podId",
                      "channel": "sms",
                      "address": "x",
                      "status": "provisioning",
                      "capabilities": [
                        "sms",
                        "sms"
                      ],
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
        let expectedResponse = ListChannelEndpointsResponse(
            endpoints: [
                ChannelEndpoint(
                    id: "id",
                    inboxId: "inboxId",
                    podId: "podId",
                    channel: ChannelEndpointChannel.sms,
                    address: "x",
                    status: ChannelEndpointStatus.provisioning,
                    capabilities: [
                        ChannelEndpointCapabilitiesItem.sms,
                        ChannelEndpointCapabilitiesItem.sms
                    ],
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                ),
                ChannelEndpoint(
                    id: "id",
                    inboxId: "inboxId",
                    podId: "podId",
                    channel: ChannelEndpointChannel.sms,
                    address: "x",
                    status: ChannelEndpointStatus.provisioning,
                    capabilities: [
                        ChannelEndpointCapabilitiesItem.sms,
                        ChannelEndpointCapabilitiesItem.sms
                    ],
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ]
        )
        let response = try await client.channelEndpoints.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "endpoint": {
                    "id": "id",
                    "inboxId": "inboxId",
                    "podId": "podId",
                    "channel": "sms",
                    "address": "address",
                    "status": "provisioning",
                    "capabilities": [
                      "sms"
                    ],
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
        let expectedResponse = CreateChannelEndpointsResponse(
            endpoint: ChannelEndpoint(
                id: "id",
                inboxId: "inboxId",
                podId: "podId",
                channel: ChannelEndpointChannel.sms,
                address: "address",
                status: ChannelEndpointStatus.provisioning,
                capabilities: [
                    ChannelEndpointCapabilitiesItem.sms
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.channelEndpoints.create(
            request: .init(
                inboxId: "inboxId",
                podId: "podId",
                channel: .sms
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
                  "endpoint": {
                    "id": "id",
                    "inboxId": "inboxId",
                    "podId": "podId",
                    "channel": "sms",
                    "address": "x",
                    "status": "provisioning",
                    "capabilities": [
                      "sms",
                      "sms"
                    ],
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
        let expectedResponse = CreateChannelEndpointsResponse(
            endpoint: ChannelEndpoint(
                id: "id",
                inboxId: "inboxId",
                podId: "podId",
                channel: ChannelEndpointChannel.sms,
                address: "x",
                status: ChannelEndpointStatus.provisioning,
                capabilities: [
                    ChannelEndpointCapabilitiesItem.sms,
                    ChannelEndpointCapabilitiesItem.sms
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.channelEndpoints.create(
            request: .init(
                inboxId: "inboxId",
                podId: "podId",
                channel: .sms
            ),
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
                  "endpoint": {
                    "id": "id",
                    "inboxId": "inboxId",
                    "podId": "podId",
                    "channel": "sms",
                    "address": "address",
                    "status": "provisioning",
                    "capabilities": [
                      "sms"
                    ],
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
        let expectedResponse = GetChannelEndpointsResponse(
            endpoint: ChannelEndpoint(
                id: "id",
                inboxId: "inboxId",
                podId: "podId",
                channel: ChannelEndpointChannel.sms,
                address: "address",
                status: ChannelEndpointStatus.provisioning,
                capabilities: [
                    ChannelEndpointCapabilitiesItem.sms
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.channelEndpoints.get(
            endpointId: "endpointId",
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
                  "endpoint": {
                    "id": "id",
                    "inboxId": "inboxId",
                    "podId": "podId",
                    "channel": "sms",
                    "address": "x",
                    "status": "provisioning",
                    "capabilities": [
                      "sms",
                      "sms"
                    ],
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
        let expectedResponse = GetChannelEndpointsResponse(
            endpoint: ChannelEndpoint(
                id: "id",
                inboxId: "inboxId",
                podId: "podId",
                channel: ChannelEndpointChannel.sms,
                address: "x",
                status: ChannelEndpointStatus.provisioning,
                capabilities: [
                    ChannelEndpointCapabilitiesItem.sms,
                    ChannelEndpointCapabilitiesItem.sms
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.channelEndpoints.get(
            endpointId: "endpointId",
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
                  "endpoint": {
                    "id": "id",
                    "inboxId": "inboxId",
                    "podId": "podId",
                    "channel": "sms",
                    "address": "address",
                    "status": "provisioning",
                    "capabilities": [
                      "sms"
                    ],
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
        let expectedResponse = UpdateChannelEndpointsResponse(
            endpoint: ChannelEndpoint(
                id: "id",
                inboxId: "inboxId",
                podId: "podId",
                channel: ChannelEndpointChannel.sms,
                address: "address",
                status: ChannelEndpointStatus.provisioning,
                capabilities: [
                    ChannelEndpointCapabilitiesItem.sms
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.channelEndpoints.update(
            endpointId: "endpointId",
            request: .init(status: .active),
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
                  "endpoint": {
                    "id": "id",
                    "inboxId": "inboxId",
                    "podId": "podId",
                    "channel": "sms",
                    "address": "x",
                    "status": "provisioning",
                    "capabilities": [
                      "sms",
                      "sms"
                    ],
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
        let expectedResponse = UpdateChannelEndpointsResponse(
            endpoint: ChannelEndpoint(
                id: "id",
                inboxId: "inboxId",
                podId: "podId",
                channel: ChannelEndpointChannel.sms,
                address: "x",
                status: ChannelEndpointStatus.provisioning,
                capabilities: [
                    ChannelEndpointCapabilitiesItem.sms,
                    ChannelEndpointCapabilitiesItem.sms
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.channelEndpoints.update(
            endpointId: "endpointId",
            request: .init(status: .active),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}