import Foundation
import Testing
import AgentMailer

@Suite("ThreadsClient Wire Tests") struct ThreadsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "threads": [
                    {
                      "id": "id",
                      "subject": "subject",
                      "participants": [
                        "participants"
                      ],
                      "messageCount": 1,
                      "lastMessageAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = ListThreadsResponse(
            threads: [
                Thread(
                    id: "id",
                    subject: "subject",
                    participants: [
                        ThreadParticipantsItem.string(
                            "participants"
                        )
                    ],
                    messageCount: 1,
                    lastMessageAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ],
            nextPageToken: Optional("nextPageToken")
        )
        let response = try await client.threads.list(
            inboxId: "inboxId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "threads": [
                    {
                      "id": "id",
                      "subject": "subject",
                      "participants": [
                        "participants",
                        "participants"
                      ],
                      "messageCount": 1,
                      "lastMessageAt": "2024-01-15T09:30:00Z"
                    },
                    {
                      "id": "id",
                      "subject": "subject",
                      "participants": [
                        "participants",
                        "participants"
                      ],
                      "messageCount": 1,
                      "lastMessageAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = ListThreadsResponse(
            threads: [
                Thread(
                    id: "id",
                    subject: "subject",
                    participants: [
                        ThreadParticipantsItem.string(
                            "participants"
                        ),
                        ThreadParticipantsItem.string(
                            "participants"
                        )
                    ],
                    messageCount: 1,
                    lastMessageAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                ),
                Thread(
                    id: "id",
                    subject: "subject",
                    participants: [
                        ThreadParticipantsItem.string(
                            "participants"
                        ),
                        ThreadParticipantsItem.string(
                            "participants"
                        )
                    ],
                    messageCount: 1,
                    lastMessageAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ],
            nextPageToken: Optional("nextPageToken")
        )
        let response = try await client.threads.list(
            inboxId: "inboxId",
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
                  "thread": {
                    "id": "id",
                    "subject": "subject",
                    "participants": [
                      "participants"
                    ],
                    "messageCount": 1,
                    "lastMessageAt": "2024-01-15T09:30:00Z"
                  },
                  "messages": [
                    {
                      "id": "id",
                      "inboxId": "inboxId",
                      "threadId": "threadId",
                      "direction": "inbound",
                      "status": "queued",
                      "from": "from",
                      "to": [
                        "to"
                      ],
                      "cc": [
                        "cc"
                      ],
                      "bcc": [
                        "bcc"
                      ],
                      "replyTo": [
                        "replyTo"
                      ],
                      "subject": "subject",
                      "text": "text",
                      "html": "html",
                      "extractedText": "extractedText",
                      "extractedHtml": "extractedHtml",
                      "headers": {
                        "key": "value"
                      },
                      "inReplyTo": "inReplyTo",
                      "references": [
                        "references"
                      ],
                      "attachments": [
                        {
                          "id": "id",
                          "filename": "filename",
                          "contentType": "contentType",
                          "size": 1,
                          "contentId": null,
                          "disposition": "attachment"
                        }
                      ],
                      "createdAt": "2024-01-15T09:30:00Z",
                      "sentAt": "2024-01-15T09:30:00Z",
                      "receivedAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = GetThreadsResponse(
            thread: Thread(
                id: "id",
                subject: "subject",
                participants: [
                    ThreadParticipantsItem.string(
                        "participants"
                    )
                ],
                messageCount: 1,
                lastMessageAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            ),
            messages: [
                Message(
                    id: "id",
                    inboxId: "inboxId",
                    threadId: "threadId",
                    direction: MessageDirection.inbound,
                    status: MessageStatus.queued,
                    from: MessageFrom.string(
                        "from"
                    ),
                    to: [
                        MessageToItem.string(
                            "to"
                        )
                    ],
                    cc: [
                        MessageCcItem.string(
                            "cc"
                        )
                    ],
                    bcc: [
                        MessageBccItem.string(
                            "bcc"
                        )
                    ],
                    replyTo: [
                        MessageReplyToItem.string(
                            "replyTo"
                        )
                    ],
                    subject: "subject",
                    text: Nullable<String>.value("text"),
                    html: Nullable<String>.value("html"),
                    extractedText: Nullable<String>.value("extractedText"),
                    extractedHtml: Nullable<String>.value("extractedHtml"),
                    headers: [
                        "key": "value"
                    ],
                    inReplyTo: Nullable<String>.value("inReplyTo"),
                    references: [
                        "references"
                    ],
                    attachments: [
                        MessageAttachmentsItem(
                            id: "id",
                            filename: "filename",
                            contentType: "contentType",
                            size: 1,
                            contentId: .null,
                            disposition: MessageAttachmentsItemDisposition.attachment
                        )
                    ],
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    sentAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    receivedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))
                )
            ]
        )
        let response = try await client.threads.get(
            inboxId: "inboxId",
            threadId: "threadId",
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
                  "thread": {
                    "id": "id",
                    "subject": "subject",
                    "participants": [
                      "participants",
                      "participants"
                    ],
                    "messageCount": 1,
                    "lastMessageAt": "2024-01-15T09:30:00Z"
                  },
                  "messages": [
                    {
                      "id": "id",
                      "inboxId": "inboxId",
                      "threadId": "threadId",
                      "direction": "inbound",
                      "status": "queued",
                      "from": "from",
                      "to": [
                        "to",
                        "to"
                      ],
                      "cc": [
                        "cc",
                        "cc"
                      ],
                      "bcc": [
                        "bcc",
                        "bcc"
                      ],
                      "replyTo": [
                        "replyTo",
                        "replyTo"
                      ],
                      "subject": "subject",
                      "text": "text",
                      "html": "html",
                      "extractedText": "extractedText",
                      "extractedHtml": "extractedHtml",
                      "headers": {
                        "headers": "headers"
                      },
                      "inReplyTo": "inReplyTo",
                      "references": [
                        "references",
                        "references"
                      ],
                      "attachments": [
                        {
                          "id": "id",
                          "filename": "filename",
                          "contentType": "contentType",
                          "size": 1,
                          "contentId": "contentId",
                          "disposition": "attachment"
                        },
                        {
                          "id": "id",
                          "filename": "filename",
                          "contentType": "contentType",
                          "size": 1,
                          "contentId": "contentId",
                          "disposition": "attachment"
                        }
                      ],
                      "createdAt": "2024-01-15T09:30:00Z",
                      "sentAt": "2024-01-15T09:30:00Z",
                      "receivedAt": "2024-01-15T09:30:00Z"
                    },
                    {
                      "id": "id",
                      "inboxId": "inboxId",
                      "threadId": "threadId",
                      "direction": "inbound",
                      "status": "queued",
                      "from": "from",
                      "to": [
                        "to",
                        "to"
                      ],
                      "cc": [
                        "cc",
                        "cc"
                      ],
                      "bcc": [
                        "bcc",
                        "bcc"
                      ],
                      "replyTo": [
                        "replyTo",
                        "replyTo"
                      ],
                      "subject": "subject",
                      "text": "text",
                      "html": "html",
                      "extractedText": "extractedText",
                      "extractedHtml": "extractedHtml",
                      "headers": {
                        "headers": "headers"
                      },
                      "inReplyTo": "inReplyTo",
                      "references": [
                        "references",
                        "references"
                      ],
                      "attachments": [
                        {
                          "id": "id",
                          "filename": "filename",
                          "contentType": "contentType",
                          "size": 1,
                          "contentId": "contentId",
                          "disposition": "attachment"
                        },
                        {
                          "id": "id",
                          "filename": "filename",
                          "contentType": "contentType",
                          "size": 1,
                          "contentId": "contentId",
                          "disposition": "attachment"
                        }
                      ],
                      "createdAt": "2024-01-15T09:30:00Z",
                      "sentAt": "2024-01-15T09:30:00Z",
                      "receivedAt": "2024-01-15T09:30:00Z"
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
        let expectedResponse = GetThreadsResponse(
            thread: Thread(
                id: "id",
                subject: "subject",
                participants: [
                    ThreadParticipantsItem.string(
                        "participants"
                    ),
                    ThreadParticipantsItem.string(
                        "participants"
                    )
                ],
                messageCount: 1,
                lastMessageAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            ),
            messages: [
                Message(
                    id: "id",
                    inboxId: "inboxId",
                    threadId: "threadId",
                    direction: MessageDirection.inbound,
                    status: MessageStatus.queued,
                    from: MessageFrom.string(
                        "from"
                    ),
                    to: [
                        MessageToItem.string(
                            "to"
                        ),
                        MessageToItem.string(
                            "to"
                        )
                    ],
                    cc: [
                        MessageCcItem.string(
                            "cc"
                        ),
                        MessageCcItem.string(
                            "cc"
                        )
                    ],
                    bcc: [
                        MessageBccItem.string(
                            "bcc"
                        ),
                        MessageBccItem.string(
                            "bcc"
                        )
                    ],
                    replyTo: [
                        MessageReplyToItem.string(
                            "replyTo"
                        ),
                        MessageReplyToItem.string(
                            "replyTo"
                        )
                    ],
                    subject: "subject",
                    text: Nullable<String>.value("text"),
                    html: Nullable<String>.value("html"),
                    extractedText: Nullable<String>.value("extractedText"),
                    extractedHtml: Nullable<String>.value("extractedHtml"),
                    headers: [
                        "headers": "headers"
                    ],
                    inReplyTo: Nullable<String>.value("inReplyTo"),
                    references: [
                        "references",
                        "references"
                    ],
                    attachments: [
                        MessageAttachmentsItem(
                            id: "id",
                            filename: "filename",
                            contentType: "contentType",
                            size: 1,
                            contentId: Nullable<String>.value("contentId"),
                            disposition: MessageAttachmentsItemDisposition.attachment
                        ),
                        MessageAttachmentsItem(
                            id: "id",
                            filename: "filename",
                            contentType: "contentType",
                            size: 1,
                            contentId: Nullable<String>.value("contentId"),
                            disposition: MessageAttachmentsItemDisposition.attachment
                        )
                    ],
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    sentAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    receivedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))
                ),
                Message(
                    id: "id",
                    inboxId: "inboxId",
                    threadId: "threadId",
                    direction: MessageDirection.inbound,
                    status: MessageStatus.queued,
                    from: MessageFrom.string(
                        "from"
                    ),
                    to: [
                        MessageToItem.string(
                            "to"
                        ),
                        MessageToItem.string(
                            "to"
                        )
                    ],
                    cc: [
                        MessageCcItem.string(
                            "cc"
                        ),
                        MessageCcItem.string(
                            "cc"
                        )
                    ],
                    bcc: [
                        MessageBccItem.string(
                            "bcc"
                        ),
                        MessageBccItem.string(
                            "bcc"
                        )
                    ],
                    replyTo: [
                        MessageReplyToItem.string(
                            "replyTo"
                        ),
                        MessageReplyToItem.string(
                            "replyTo"
                        )
                    ],
                    subject: "subject",
                    text: Nullable<String>.value("text"),
                    html: Nullable<String>.value("html"),
                    extractedText: Nullable<String>.value("extractedText"),
                    extractedHtml: Nullable<String>.value("extractedHtml"),
                    headers: [
                        "headers": "headers"
                    ],
                    inReplyTo: Nullable<String>.value("inReplyTo"),
                    references: [
                        "references",
                        "references"
                    ],
                    attachments: [
                        MessageAttachmentsItem(
                            id: "id",
                            filename: "filename",
                            contentType: "contentType",
                            size: 1,
                            contentId: Nullable<String>.value("contentId"),
                            disposition: MessageAttachmentsItemDisposition.attachment
                        ),
                        MessageAttachmentsItem(
                            id: "id",
                            filename: "filename",
                            contentType: "contentType",
                            size: 1,
                            contentId: Nullable<String>.value("contentId"),
                            disposition: MessageAttachmentsItemDisposition.attachment
                        )
                    ],
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    sentAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    receivedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))
                )
            ]
        )
        let response = try await client.threads.get(
            inboxId: "inboxId",
            threadId: "threadId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}