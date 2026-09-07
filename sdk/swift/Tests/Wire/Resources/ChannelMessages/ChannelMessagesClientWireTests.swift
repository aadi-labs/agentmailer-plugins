import Foundation
import Testing
import AgentMailer

@Suite("ChannelMessagesClient Wire Tests") struct ChannelMessagesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "messages": [
                    {
                      "id": "id",
                      "endpointId": "endpointId",
                      "conversationId": "conversationId",
                      "channel": "sms",
                      "direction": "inbound",
                      "status": "queued",
                      "from": "from",
                      "to": "to",
                      "text": "text",
                      "mediaUrls": [
                        "mediaUrls"
                      ],
                      "attachmentIds": [],
                      "providerMessageId": "providerMessageId",
                      "failureCode": "failureCode",
                      "safety": {
                        "action": "allow",
                        "risk": "low",
                        "score": 1.1,
                        "signals": [
                          "signals"
                        ],
                        "classifier": "local",
                        "modelStatus": "not_configured"
                      },
                      "createdAt": "2024-01-15T09:30:00Z",
                      "sentAt": "2024-01-15T09:30:00Z",
                      "receivedAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = ListChannelMessagesResponse(
            messages: [
                ChannelMessage(
                    id: "id",
                    endpointId: "endpointId",
                    conversationId: "conversationId",
                    channel: ChannelMessageChannel.sms,
                    direction: ChannelMessageDirection.inbound,
                    status: ChannelMessageStatus.queued,
                    from: "from",
                    to: "to",
                    text: Nullable<String>.value("text"),
                    mediaUrls: [
                        "mediaUrls"
                    ],
                    attachmentIds: [],
                    providerMessageId: Nullable<String>.value("providerMessageId"),
                    failureCode: Nullable<String>.value("failureCode"),
                    safety: Nullable<ChannelMessageSafety>.value(ChannelMessageSafety(
                        action: ChannelMessageSafetyAction.allow,
                        risk: ChannelMessageSafetyRisk.low,
                        score: 1.1,
                        signals: [
                            "signals"
                        ],
                        classifier: ChannelMessageSafetyClassifier.local,
                        modelStatus: ChannelMessageSafetyModelStatus.notConfigured
                    )),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    sentAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    receivedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))
                )
            ],
            nextPageToken: "nextPageToken"
        )
        let response = try await client.channelMessages.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "messages": [
                    {
                      "id": "id",
                      "endpointId": "endpointId",
                      "conversationId": "conversationId",
                      "channel": "sms",
                      "direction": "inbound",
                      "status": "queued",
                      "from": "x",
                      "to": "x",
                      "text": "text",
                      "mediaUrls": [
                        "mediaUrls",
                        "mediaUrls"
                      ],
                      "attachmentIds": [
                        {
                          "key": "value"
                        },
                        {
                          "key": "value"
                        }
                      ],
                      "providerMessageId": "providerMessageId",
                      "failureCode": "failureCode",
                      "safety": {
                        "action": "allow",
                        "risk": "low",
                        "score": 100,
                        "signals": [
                          "signals",
                          "signals"
                        ],
                        "classifier": "local",
                        "modelStatus": "not_configured"
                      },
                      "createdAt": "2024-01-15T09:30:00Z",
                      "sentAt": "2024-01-15T09:30:00Z",
                      "receivedAt": "2024-01-15T09:30:00Z"
                    },
                    {
                      "id": "id",
                      "endpointId": "endpointId",
                      "conversationId": "conversationId",
                      "channel": "sms",
                      "direction": "inbound",
                      "status": "queued",
                      "from": "x",
                      "to": "x",
                      "text": "text",
                      "mediaUrls": [
                        "mediaUrls",
                        "mediaUrls"
                      ],
                      "attachmentIds": [
                        {
                          "key": "value"
                        },
                        {
                          "key": "value"
                        }
                      ],
                      "providerMessageId": "providerMessageId",
                      "failureCode": "failureCode",
                      "safety": {
                        "action": "allow",
                        "risk": "low",
                        "score": 100,
                        "signals": [
                          "signals",
                          "signals"
                        ],
                        "classifier": "local",
                        "modelStatus": "not_configured"
                      },
                      "createdAt": "2024-01-15T09:30:00Z",
                      "sentAt": "2024-01-15T09:30:00Z",
                      "receivedAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = ListChannelMessagesResponse(
            messages: [
                ChannelMessage(
                    id: "id",
                    endpointId: "endpointId",
                    conversationId: "conversationId",
                    channel: ChannelMessageChannel.sms,
                    direction: ChannelMessageDirection.inbound,
                    status: ChannelMessageStatus.queued,
                    from: "x",
                    to: "x",
                    text: Nullable<String>.value("text"),
                    mediaUrls: [
                        "mediaUrls",
                        "mediaUrls"
                    ],
                    attachmentIds: [
                        JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        ),
                        JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    providerMessageId: Nullable<String>.value("providerMessageId"),
                    failureCode: Nullable<String>.value("failureCode"),
                    safety: Nullable<ChannelMessageSafety>.value(ChannelMessageSafety(
                        action: ChannelMessageSafetyAction.allow,
                        risk: ChannelMessageSafetyRisk.low,
                        score: 100,
                        signals: [
                            "signals",
                            "signals"
                        ],
                        classifier: ChannelMessageSafetyClassifier.local,
                        modelStatus: ChannelMessageSafetyModelStatus.notConfigured
                    )),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    sentAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    receivedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))
                ),
                ChannelMessage(
                    id: "id",
                    endpointId: "endpointId",
                    conversationId: "conversationId",
                    channel: ChannelMessageChannel.sms,
                    direction: ChannelMessageDirection.inbound,
                    status: ChannelMessageStatus.queued,
                    from: "x",
                    to: "x",
                    text: Nullable<String>.value("text"),
                    mediaUrls: [
                        "mediaUrls",
                        "mediaUrls"
                    ],
                    attachmentIds: [
                        JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        ),
                        JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    providerMessageId: Nullable<String>.value("providerMessageId"),
                    failureCode: Nullable<String>.value("failureCode"),
                    safety: Nullable<ChannelMessageSafety>.value(ChannelMessageSafety(
                        action: ChannelMessageSafetyAction.allow,
                        risk: ChannelMessageSafetyRisk.low,
                        score: 100,
                        signals: [
                            "signals",
                            "signals"
                        ],
                        classifier: ChannelMessageSafetyClassifier.local,
                        modelStatus: ChannelMessageSafetyModelStatus.notConfigured
                    )),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    sentAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    receivedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))
                )
            ],
            nextPageToken: "nextPageToken"
        )
        let response = try await client.channelMessages.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func send1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "message": {
                    "id": "id",
                    "endpointId": "endpointId",
                    "conversationId": "conversationId",
                    "channel": "sms",
                    "direction": "inbound",
                    "status": "queued",
                    "from": "from",
                    "to": "to",
                    "text": "text",
                    "mediaUrls": [
                      "mediaUrls"
                    ],
                    "attachmentIds": [
                      {
                        "key": "value"
                      }
                    ],
                    "providerMessageId": "providerMessageId",
                    "failureCode": "failureCode",
                    "safety": {
                      "action": "allow",
                      "risk": "low",
                      "score": 1.1,
                      "signals": [
                        "signals"
                      ],
                      "classifier": "local",
                      "modelStatus": "not_configured"
                    },
                    "createdAt": "2024-01-15T09:30:00Z",
                    "sentAt": "2024-01-15T09:30:00Z",
                    "receivedAt": "2024-01-15T09:30:00Z"
                  },
                  "replayed": true
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SendChannelMessagesResponse(
            message: ChannelMessage(
                id: "id",
                endpointId: "endpointId",
                conversationId: "conversationId",
                channel: ChannelMessageChannel.sms,
                direction: ChannelMessageDirection.inbound,
                status: ChannelMessageStatus.queued,
                from: "from",
                to: "to",
                text: Nullable<String>.value("text"),
                mediaUrls: [
                    "mediaUrls"
                ],
                attachmentIds: [
                    JSONValue.object(
                        [
                            "key": JSONValue.string("value")
                        ]
                    )
                ],
                providerMessageId: Nullable<String>.value("providerMessageId"),
                failureCode: Nullable<String>.value("failureCode"),
                safety: Nullable<ChannelMessageSafety>.value(ChannelMessageSafety(
                    action: ChannelMessageSafetyAction.allow,
                    risk: ChannelMessageSafetyRisk.low,
                    score: 1.1,
                    signals: [
                        "signals"
                    ],
                    classifier: ChannelMessageSafetyClassifier.local,
                    modelStatus: ChannelMessageSafetyModelStatus.notConfigured
                )),
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                sentAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                receivedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))
            ),
            replayed: true
        )
        let response = try await client.channelMessages.send(
            idempotencyKey: "Idempotency-Key",
            request: ChannelMessageSend.sms(
                ChannelMessageSendSms(
                    endpointId: "endpointId",
                    to: "to",
                    consent: ChannelMessageSendSmsConsent(
                        basis: .explicit,
                        capturedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                        reference: "reference"
                    ),
                    content: ChannelMessageSendSmsContent(
                        type: .text,
                        body: "body"
                    )
                )
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func send2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "message": {
                    "id": "id",
                    "endpointId": "endpointId",
                    "conversationId": "conversationId",
                    "channel": "sms",
                    "direction": "inbound",
                    "status": "queued",
                    "from": "x",
                    "to": "x",
                    "text": "text",
                    "mediaUrls": [
                      "mediaUrls",
                      "mediaUrls"
                    ],
                    "attachmentIds": [
                      {
                        "key": "value"
                      },
                      {
                        "key": "value"
                      }
                    ],
                    "providerMessageId": "providerMessageId",
                    "failureCode": "failureCode",
                    "safety": {
                      "action": "allow",
                      "risk": "low",
                      "score": 100,
                      "signals": [
                        "signals",
                        "signals"
                      ],
                      "classifier": "local",
                      "modelStatus": "not_configured"
                    },
                    "createdAt": "2024-01-15T09:30:00Z",
                    "sentAt": "2024-01-15T09:30:00Z",
                    "receivedAt": "2024-01-15T09:30:00Z"
                  },
                  "replayed": true
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SendChannelMessagesResponse(
            message: ChannelMessage(
                id: "id",
                endpointId: "endpointId",
                conversationId: "conversationId",
                channel: ChannelMessageChannel.sms,
                direction: ChannelMessageDirection.inbound,
                status: ChannelMessageStatus.queued,
                from: "x",
                to: "x",
                text: Nullable<String>.value("text"),
                mediaUrls: [
                    "mediaUrls",
                    "mediaUrls"
                ],
                attachmentIds: [
                    JSONValue.object(
                        [
                            "key": JSONValue.string("value")
                        ]
                    ),
                    JSONValue.object(
                        [
                            "key": JSONValue.string("value")
                        ]
                    )
                ],
                providerMessageId: Nullable<String>.value("providerMessageId"),
                failureCode: Nullable<String>.value("failureCode"),
                safety: Nullable<ChannelMessageSafety>.value(ChannelMessageSafety(
                    action: ChannelMessageSafetyAction.allow,
                    risk: ChannelMessageSafetyRisk.low,
                    score: 100,
                    signals: [
                        "signals",
                        "signals"
                    ],
                    classifier: ChannelMessageSafetyClassifier.local,
                    modelStatus: ChannelMessageSafetyModelStatus.notConfigured
                )),
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                sentAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                receivedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))
            ),
            replayed: true
        )
        let response = try await client.channelMessages.send(
            idempotencyKey: "idempotencyKey",
            request: ChannelMessageSend.sms(
                ChannelMessageSendSms(
                    endpointId: "endpointId",
                    to: "to",
                    consent: ChannelMessageSendSmsConsent(
                        basis: .explicit,
                        capturedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                        reference: "x"
                    ),
                    content: ChannelMessageSendSmsContent(
                        type: .text,
                        body: "x"
                    )
                )
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}