import Foundation
import Testing
import AgentMailer

@Suite("ChannelConversationsClient Wire Tests") struct ChannelConversationsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "conversations": [
                    {
                      "id": "id",
                      "endpointId": "endpointId",
                      "channel": "sms",
                      "remoteAddress": "remoteAddress",
                      "status": "active",
                      "messageCount": 1,
                      "lastMessageAt": "2024-01-15T09:30:00Z",
                      "lastInboundAt": "2024-01-15T09:30:00Z",
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
        let expectedResponse = ListChannelConversationsResponse(
            conversations: [
                ChannelConversation(
                    id: "id",
                    endpointId: "endpointId",
                    channel: ChannelConversationChannel.sms,
                    remoteAddress: "remoteAddress",
                    status: ChannelConversationStatus.active,
                    messageCount: 1,
                    lastMessageAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    lastInboundAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ],
            nextPageToken: "nextPageToken"
        )
        let response = try await client.channelConversations.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "conversations": [
                    {
                      "id": "id",
                      "endpointId": "endpointId",
                      "channel": "sms",
                      "remoteAddress": "x",
                      "status": "active",
                      "messageCount": 1,
                      "lastMessageAt": "2024-01-15T09:30:00Z",
                      "lastInboundAt": "2024-01-15T09:30:00Z",
                      "createdAt": "2024-01-15T09:30:00Z",
                      "updatedAt": "2024-01-15T09:30:00Z"
                    },
                    {
                      "id": "id",
                      "endpointId": "endpointId",
                      "channel": "sms",
                      "remoteAddress": "x",
                      "status": "active",
                      "messageCount": 1,
                      "lastMessageAt": "2024-01-15T09:30:00Z",
                      "lastInboundAt": "2024-01-15T09:30:00Z",
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
        let expectedResponse = ListChannelConversationsResponse(
            conversations: [
                ChannelConversation(
                    id: "id",
                    endpointId: "endpointId",
                    channel: ChannelConversationChannel.sms,
                    remoteAddress: "x",
                    status: ChannelConversationStatus.active,
                    messageCount: 1,
                    lastMessageAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    lastInboundAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                ),
                ChannelConversation(
                    id: "id",
                    endpointId: "endpointId",
                    channel: ChannelConversationChannel.sms,
                    remoteAddress: "x",
                    status: ChannelConversationStatus.active,
                    messageCount: 1,
                    lastMessageAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    lastInboundAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ],
            nextPageToken: "nextPageToken"
        )
        let response = try await client.channelConversations.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func get1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "conversation": {
                    "id": "id",
                    "endpointId": "endpointId",
                    "channel": "sms",
                    "remoteAddress": "remoteAddress",
                    "status": "active",
                    "messageCount": 1,
                    "lastMessageAt": "2024-01-15T09:30:00Z",
                    "lastInboundAt": "2024-01-15T09:30:00Z",
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
        let expectedResponse = GetChannelConversationsResponse(
            conversation: ChannelConversation(
                id: "id",
                endpointId: "endpointId",
                channel: ChannelConversationChannel.sms,
                remoteAddress: "remoteAddress",
                status: ChannelConversationStatus.active,
                messageCount: 1,
                lastMessageAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                lastInboundAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.channelConversations.get(
            conversationId: "conversationId",
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
                  "conversation": {
                    "id": "id",
                    "endpointId": "endpointId",
                    "channel": "sms",
                    "remoteAddress": "x",
                    "status": "active",
                    "messageCount": 1,
                    "lastMessageAt": "2024-01-15T09:30:00Z",
                    "lastInboundAt": "2024-01-15T09:30:00Z",
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
        let expectedResponse = GetChannelConversationsResponse(
            conversation: ChannelConversation(
                id: "id",
                endpointId: "endpointId",
                channel: ChannelConversationChannel.sms,
                remoteAddress: "x",
                status: ChannelConversationStatus.active,
                messageCount: 1,
                lastMessageAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                lastInboundAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.channelConversations.get(
            conversationId: "conversationId",
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
                  "conversation": {
                    "id": "id",
                    "endpointId": "endpointId",
                    "channel": "sms",
                    "remoteAddress": "remoteAddress",
                    "status": "active",
                    "messageCount": 1,
                    "lastMessageAt": "2024-01-15T09:30:00Z",
                    "lastInboundAt": "2024-01-15T09:30:00Z",
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
        let expectedResponse = UpdateChannelConversationsResponse(
            conversation: ChannelConversation(
                id: "id",
                endpointId: "endpointId",
                channel: ChannelConversationChannel.sms,
                remoteAddress: "remoteAddress",
                status: ChannelConversationStatus.active,
                messageCount: 1,
                lastMessageAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                lastInboundAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.channelConversations.update(
            conversationId: "conversationId",
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
                  "conversation": {
                    "id": "id",
                    "endpointId": "endpointId",
                    "channel": "sms",
                    "remoteAddress": "x",
                    "status": "active",
                    "messageCount": 1,
                    "lastMessageAt": "2024-01-15T09:30:00Z",
                    "lastInboundAt": "2024-01-15T09:30:00Z",
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
        let expectedResponse = UpdateChannelConversationsResponse(
            conversation: ChannelConversation(
                id: "id",
                endpointId: "endpointId",
                channel: ChannelConversationChannel.sms,
                remoteAddress: "x",
                status: ChannelConversationStatus.active,
                messageCount: 1,
                lastMessageAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                lastInboundAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.channelConversations.update(
            conversationId: "conversationId",
            request: .init(status: .active),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}