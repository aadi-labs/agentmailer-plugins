import Foundation
import Testing
import AgentMailer

@Suite("MessagesClient Wire Tests") struct MessagesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
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
        let expectedResponse = ListMessagesResponse(
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
            ],
            nextPageToken: Optional("nextPageToken")
        )
        let response = try await client.messages.list(
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
        let expectedResponse = ListMessagesResponse(
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
            ],
            nextPageToken: Optional("nextPageToken")
        )
        let response = try await client.messages.list(
            inboxId: "inboxId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
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
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SendMessagesResponse(
            message: Message(
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
        )
        let response = try await client.messages.send(
            inboxId: "inboxId",
            request: MessageCompose(
                to: [
                    MessageComposeToItem.string(
                        "to"
                    )
                ]
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
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SendMessagesResponse(
            message: Message(
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
        )
        let response = try await client.messages.send(
            inboxId: "inboxId",
            request: MessageCompose(
                to: [
                    MessageComposeToItem.string(
                        "to"
                    ),
                    MessageComposeToItem.string(
                        "to"
                    )
                ]
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
                  "message": {
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
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = GetMessagesResponse(
            message: Message(
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
        )
        let response = try await client.messages.get(
            inboxId: "inboxId",
            messageId: "messageId",
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
                  "message": {
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
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = GetMessagesResponse(
            message: Message(
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
        )
        let response = try await client.messages.get(
            inboxId: "inboxId",
            messageId: "messageId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func reply1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "message": {
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
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ReplyMessagesResponse(
            message: Message(
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
        )
        let response = try await client.messages.reply(
            inboxId: "inboxId",
            messageId: "messageId",
            request: ReplyCompose(

            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func reply2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "message": {
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
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ReplyMessagesResponse(
            message: Message(
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
        )
        let response = try await client.messages.reply(
            inboxId: "inboxId",
            messageId: "messageId",
            request: ReplyCompose(

            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func replyAll1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "message": {
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
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ReplyAllMessagesResponse(
            message: Message(
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
        )
        let response = try await client.messages.replyAll(
            inboxId: "inboxId",
            messageId: "messageId",
            request: ReplyCompose(

            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func replyAll2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "message": {
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
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ReplyAllMessagesResponse(
            message: Message(
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
        )
        let response = try await client.messages.replyAll(
            inboxId: "inboxId",
            messageId: "messageId",
            request: ReplyCompose(

            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func forward1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "message": {
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
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ForwardMessagesResponse(
            message: Message(
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
        )
        let response = try await client.messages.forward(
            inboxId: "inboxId",
            messageId: "messageId",
            request: MessageCompose(
                to: [
                    MessageComposeToItem.string(
                        "to"
                    )
                ]
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func forward2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "message": {
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
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ForwardMessagesResponse(
            message: Message(
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
        )
        let response = try await client.messages.forward(
            inboxId: "inboxId",
            messageId: "messageId",
            request: MessageCompose(
                to: [
                    MessageComposeToItem.string(
                        "to"
                    ),
                    MessageComposeToItem.string(
                        "to"
                    )
                ]
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}