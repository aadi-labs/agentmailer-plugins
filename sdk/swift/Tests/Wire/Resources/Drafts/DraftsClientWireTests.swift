import Foundation
import Testing
import AgentMailer

@Suite("DraftsClient Wire Tests") struct DraftsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "drafts": [
                    {
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
                      "headers": {
                        "key": "value"
                      },
                      "attachments": [],
                      "replyToMessageId": "replyToMessageId",
                      "forwardMessageId": "forwardMessageId",
                      "sendAt": "2024-01-15T09:30:00Z",
                      "id": "id",
                      "inboxId": "inboxId",
                      "createdAt": "2024-01-15T09:30:00Z",
                      "updatedAt": "2024-01-15T09:30:00Z",
                      "sendStatus": "scheduled"
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
        let expectedResponse = ListDraftsResponse(
            drafts: [
                Draft(
                    to: [
                        DraftToItem.string(
                            "to"
                        )
                    ],
                    cc: Optional([
                        DraftCcItem.string(
                            "cc"
                        )
                    ]),
                    bcc: Optional([
                        DraftBccItem.string(
                            "bcc"
                        )
                    ]),
                    replyTo: Optional([
                        DraftReplyToItem.string(
                            "replyTo"
                        )
                    ]),
                    subject: Optional("subject"),
                    text: Optional("text"),
                    html: Optional("html"),
                    headers: Optional([
                        "key": "value"
                    ]),
                    attachments: [],
                    replyToMessageId: Optional("replyToMessageId"),
                    forwardMessageId: Optional("forwardMessageId"),
                    sendAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                    id: "id",
                    inboxId: "inboxId",
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    sendStatus: Nullable<DraftSendStatus>.value(DraftSendStatus.scheduled)
                )
            ]
        )
        let response = try await client.drafts.list(
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
                  "drafts": [
                    {
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
                      "subject": "",
                      "text": "text",
                      "html": "html",
                      "headers": {
                        "headers": "headers"
                      },
                      "attachments": [
                        {
                          "filename": "x",
                          "contentType": {
                            "key": "value"
                          },
                          "content": "content",
                          "contentId": "contentId",
                          "disposition": "attachment"
                        },
                        {
                          "filename": "x",
                          "contentType": {
                            "key": "value"
                          },
                          "content": "content",
                          "contentId": "contentId",
                          "disposition": "attachment"
                        }
                      ],
                      "replyToMessageId": "replyToMessageId",
                      "forwardMessageId": "forwardMessageId",
                      "sendAt": "2024-01-15T09:30:00Z",
                      "id": "id",
                      "inboxId": "inboxId",
                      "createdAt": "2024-01-15T09:30:00Z",
                      "updatedAt": "2024-01-15T09:30:00Z",
                      "sendStatus": "scheduled"
                    },
                    {
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
                      "subject": "",
                      "text": "text",
                      "html": "html",
                      "headers": {
                        "headers": "headers"
                      },
                      "attachments": [
                        {
                          "filename": "x",
                          "contentType": {
                            "key": "value"
                          },
                          "content": "content",
                          "contentId": "contentId",
                          "disposition": "attachment"
                        },
                        {
                          "filename": "x",
                          "contentType": {
                            "key": "value"
                          },
                          "content": "content",
                          "contentId": "contentId",
                          "disposition": "attachment"
                        }
                      ],
                      "replyToMessageId": "replyToMessageId",
                      "forwardMessageId": "forwardMessageId",
                      "sendAt": "2024-01-15T09:30:00Z",
                      "id": "id",
                      "inboxId": "inboxId",
                      "createdAt": "2024-01-15T09:30:00Z",
                      "updatedAt": "2024-01-15T09:30:00Z",
                      "sendStatus": "scheduled"
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
        let expectedResponse = ListDraftsResponse(
            drafts: [
                Draft(
                    to: [
                        DraftToItem.string(
                            "to"
                        ),
                        DraftToItem.string(
                            "to"
                        )
                    ],
                    cc: Optional([
                        DraftCcItem.string(
                            "cc"
                        ),
                        DraftCcItem.string(
                            "cc"
                        )
                    ]),
                    bcc: Optional([
                        DraftBccItem.string(
                            "bcc"
                        ),
                        DraftBccItem.string(
                            "bcc"
                        )
                    ]),
                    replyTo: Optional([
                        DraftReplyToItem.string(
                            "replyTo"
                        ),
                        DraftReplyToItem.string(
                            "replyTo"
                        )
                    ]),
                    subject: Optional(""),
                    text: Optional("text"),
                    html: Optional("html"),
                    headers: Optional([
                        "headers": "headers"
                    ]),
                    attachments: [
                        DraftAttachmentsItem.draftAttachmentsItemContent(
                            DraftAttachmentsItemContent(
                                filename: "x",
                                contentType: JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                ),
                                content: "content",
                                contentId: Optional("contentId"),
                                disposition: DraftAttachmentsItemContentDisposition.attachment
                            )
                        ),
                        DraftAttachmentsItem.draftAttachmentsItemContent(
                            DraftAttachmentsItemContent(
                                filename: "x",
                                contentType: JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                ),
                                content: "content",
                                contentId: Optional("contentId"),
                                disposition: DraftAttachmentsItemContentDisposition.attachment
                            )
                        )
                    ],
                    replyToMessageId: Optional("replyToMessageId"),
                    forwardMessageId: Optional("forwardMessageId"),
                    sendAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                    id: "id",
                    inboxId: "inboxId",
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    sendStatus: Nullable<DraftSendStatus>.value(DraftSendStatus.scheduled)
                ),
                Draft(
                    to: [
                        DraftToItem.string(
                            "to"
                        ),
                        DraftToItem.string(
                            "to"
                        )
                    ],
                    cc: Optional([
                        DraftCcItem.string(
                            "cc"
                        ),
                        DraftCcItem.string(
                            "cc"
                        )
                    ]),
                    bcc: Optional([
                        DraftBccItem.string(
                            "bcc"
                        ),
                        DraftBccItem.string(
                            "bcc"
                        )
                    ]),
                    replyTo: Optional([
                        DraftReplyToItem.string(
                            "replyTo"
                        ),
                        DraftReplyToItem.string(
                            "replyTo"
                        )
                    ]),
                    subject: Optional(""),
                    text: Optional("text"),
                    html: Optional("html"),
                    headers: Optional([
                        "headers": "headers"
                    ]),
                    attachments: [
                        DraftAttachmentsItem.draftAttachmentsItemContent(
                            DraftAttachmentsItemContent(
                                filename: "x",
                                contentType: JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                ),
                                content: "content",
                                contentId: Optional("contentId"),
                                disposition: DraftAttachmentsItemContentDisposition.attachment
                            )
                        ),
                        DraftAttachmentsItem.draftAttachmentsItemContent(
                            DraftAttachmentsItemContent(
                                filename: "x",
                                contentType: JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                ),
                                content: "content",
                                contentId: Optional("contentId"),
                                disposition: DraftAttachmentsItemContentDisposition.attachment
                            )
                        )
                    ],
                    replyToMessageId: Optional("replyToMessageId"),
                    forwardMessageId: Optional("forwardMessageId"),
                    sendAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                    id: "id",
                    inboxId: "inboxId",
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    sendStatus: Nullable<DraftSendStatus>.value(DraftSendStatus.scheduled)
                )
            ]
        )
        let response = try await client.drafts.list(
            inboxId: "inboxId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "draft": {
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
                    "headers": {
                      "key": "value"
                    },
                    "attachments": [],
                    "replyToMessageId": "replyToMessageId",
                    "forwardMessageId": "forwardMessageId",
                    "sendAt": "2024-01-15T09:30:00Z",
                    "id": "id",
                    "inboxId": "inboxId",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "updatedAt": "2024-01-15T09:30:00Z",
                    "sendStatus": "scheduled"
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
        let expectedResponse = CreateDraftsResponse(
            draft: Draft(
                to: [
                    DraftToItem.string(
                        "to"
                    )
                ],
                cc: Optional([
                    DraftCcItem.string(
                        "cc"
                    )
                ]),
                bcc: Optional([
                    DraftBccItem.string(
                        "bcc"
                    )
                ]),
                replyTo: Optional([
                    DraftReplyToItem.string(
                        "replyTo"
                    )
                ]),
                subject: Optional("subject"),
                text: Optional("text"),
                html: Optional("html"),
                headers: Optional([
                    "key": "value"
                ]),
                attachments: [],
                replyToMessageId: Optional("replyToMessageId"),
                forwardMessageId: Optional("forwardMessageId"),
                sendAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                id: "id",
                inboxId: "inboxId",
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                sendStatus: Nullable<DraftSendStatus>.value(DraftSendStatus.scheduled)
            )
        )
        let response = try await client.drafts.create(
            inboxId: "inboxId",
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
                  "draft": {
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
                    "subject": "",
                    "text": "text",
                    "html": "html",
                    "headers": {
                      "headers": "headers"
                    },
                    "attachments": [
                      {
                        "filename": "x",
                        "contentType": {
                          "key": "value"
                        },
                        "content": "content",
                        "contentId": "contentId",
                        "disposition": "attachment"
                      },
                      {
                        "filename": "x",
                        "contentType": {
                          "key": "value"
                        },
                        "content": "content",
                        "contentId": "contentId",
                        "disposition": "attachment"
                      }
                    ],
                    "replyToMessageId": "replyToMessageId",
                    "forwardMessageId": "forwardMessageId",
                    "sendAt": "2024-01-15T09:30:00Z",
                    "id": "id",
                    "inboxId": "inboxId",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "updatedAt": "2024-01-15T09:30:00Z",
                    "sendStatus": "scheduled"
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
        let expectedResponse = CreateDraftsResponse(
            draft: Draft(
                to: [
                    DraftToItem.string(
                        "to"
                    ),
                    DraftToItem.string(
                        "to"
                    )
                ],
                cc: Optional([
                    DraftCcItem.string(
                        "cc"
                    ),
                    DraftCcItem.string(
                        "cc"
                    )
                ]),
                bcc: Optional([
                    DraftBccItem.string(
                        "bcc"
                    ),
                    DraftBccItem.string(
                        "bcc"
                    )
                ]),
                replyTo: Optional([
                    DraftReplyToItem.string(
                        "replyTo"
                    ),
                    DraftReplyToItem.string(
                        "replyTo"
                    )
                ]),
                subject: Optional(""),
                text: Optional("text"),
                html: Optional("html"),
                headers: Optional([
                    "headers": "headers"
                ]),
                attachments: [
                    DraftAttachmentsItem.draftAttachmentsItemContent(
                        DraftAttachmentsItemContent(
                            filename: "x",
                            contentType: JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            ),
                            content: "content",
                            contentId: Optional("contentId"),
                            disposition: DraftAttachmentsItemContentDisposition.attachment
                        )
                    ),
                    DraftAttachmentsItem.draftAttachmentsItemContent(
                        DraftAttachmentsItemContent(
                            filename: "x",
                            contentType: JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            ),
                            content: "content",
                            contentId: Optional("contentId"),
                            disposition: DraftAttachmentsItemContentDisposition.attachment
                        )
                    )
                ],
                replyToMessageId: Optional("replyToMessageId"),
                forwardMessageId: Optional("forwardMessageId"),
                sendAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                id: "id",
                inboxId: "inboxId",
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                sendStatus: Nullable<DraftSendStatus>.value(DraftSendStatus.scheduled)
            )
        )
        let response = try await client.drafts.create(
            inboxId: "inboxId",
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
                  "draft": {
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
                    "headers": {
                      "key": "value"
                    },
                    "attachments": [],
                    "replyToMessageId": "replyToMessageId",
                    "forwardMessageId": "forwardMessageId",
                    "sendAt": "2024-01-15T09:30:00Z",
                    "id": "id",
                    "inboxId": "inboxId",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "updatedAt": "2024-01-15T09:30:00Z",
                    "sendStatus": "scheduled"
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
        let expectedResponse = GetDraftsResponse(
            draft: Draft(
                to: [
                    DraftToItem.string(
                        "to"
                    )
                ],
                cc: Optional([
                    DraftCcItem.string(
                        "cc"
                    )
                ]),
                bcc: Optional([
                    DraftBccItem.string(
                        "bcc"
                    )
                ]),
                replyTo: Optional([
                    DraftReplyToItem.string(
                        "replyTo"
                    )
                ]),
                subject: Optional("subject"),
                text: Optional("text"),
                html: Optional("html"),
                headers: Optional([
                    "key": "value"
                ]),
                attachments: [],
                replyToMessageId: Optional("replyToMessageId"),
                forwardMessageId: Optional("forwardMessageId"),
                sendAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                id: "id",
                inboxId: "inboxId",
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                sendStatus: Nullable<DraftSendStatus>.value(DraftSendStatus.scheduled)
            )
        )
        let response = try await client.drafts.get(
            inboxId: "inboxId",
            draftId: "draftId",
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
                  "draft": {
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
                    "subject": "",
                    "text": "text",
                    "html": "html",
                    "headers": {
                      "headers": "headers"
                    },
                    "attachments": [
                      {
                        "filename": "x",
                        "contentType": {
                          "key": "value"
                        },
                        "content": "content",
                        "contentId": "contentId",
                        "disposition": "attachment"
                      },
                      {
                        "filename": "x",
                        "contentType": {
                          "key": "value"
                        },
                        "content": "content",
                        "contentId": "contentId",
                        "disposition": "attachment"
                      }
                    ],
                    "replyToMessageId": "replyToMessageId",
                    "forwardMessageId": "forwardMessageId",
                    "sendAt": "2024-01-15T09:30:00Z",
                    "id": "id",
                    "inboxId": "inboxId",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "updatedAt": "2024-01-15T09:30:00Z",
                    "sendStatus": "scheduled"
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
        let expectedResponse = GetDraftsResponse(
            draft: Draft(
                to: [
                    DraftToItem.string(
                        "to"
                    ),
                    DraftToItem.string(
                        "to"
                    )
                ],
                cc: Optional([
                    DraftCcItem.string(
                        "cc"
                    ),
                    DraftCcItem.string(
                        "cc"
                    )
                ]),
                bcc: Optional([
                    DraftBccItem.string(
                        "bcc"
                    ),
                    DraftBccItem.string(
                        "bcc"
                    )
                ]),
                replyTo: Optional([
                    DraftReplyToItem.string(
                        "replyTo"
                    ),
                    DraftReplyToItem.string(
                        "replyTo"
                    )
                ]),
                subject: Optional(""),
                text: Optional("text"),
                html: Optional("html"),
                headers: Optional([
                    "headers": "headers"
                ]),
                attachments: [
                    DraftAttachmentsItem.draftAttachmentsItemContent(
                        DraftAttachmentsItemContent(
                            filename: "x",
                            contentType: JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            ),
                            content: "content",
                            contentId: Optional("contentId"),
                            disposition: DraftAttachmentsItemContentDisposition.attachment
                        )
                    ),
                    DraftAttachmentsItem.draftAttachmentsItemContent(
                        DraftAttachmentsItemContent(
                            filename: "x",
                            contentType: JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            ),
                            content: "content",
                            contentId: Optional("contentId"),
                            disposition: DraftAttachmentsItemContentDisposition.attachment
                        )
                    )
                ],
                replyToMessageId: Optional("replyToMessageId"),
                forwardMessageId: Optional("forwardMessageId"),
                sendAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                id: "id",
                inboxId: "inboxId",
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                sendStatus: Nullable<DraftSendStatus>.value(DraftSendStatus.scheduled)
            )
        )
        let response = try await client.drafts.get(
            inboxId: "inboxId",
            draftId: "draftId",
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
                  "draft": {
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
                    "headers": {
                      "key": "value"
                    },
                    "attachments": [],
                    "replyToMessageId": "replyToMessageId",
                    "forwardMessageId": "forwardMessageId",
                    "sendAt": "2024-01-15T09:30:00Z",
                    "id": "id",
                    "inboxId": "inboxId",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "updatedAt": "2024-01-15T09:30:00Z",
                    "sendStatus": "scheduled"
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
        let expectedResponse = UpdateDraftsResponse(
            draft: Draft(
                to: [
                    DraftToItem.string(
                        "to"
                    )
                ],
                cc: Optional([
                    DraftCcItem.string(
                        "cc"
                    )
                ]),
                bcc: Optional([
                    DraftBccItem.string(
                        "bcc"
                    )
                ]),
                replyTo: Optional([
                    DraftReplyToItem.string(
                        "replyTo"
                    )
                ]),
                subject: Optional("subject"),
                text: Optional("text"),
                html: Optional("html"),
                headers: Optional([
                    "key": "value"
                ]),
                attachments: [],
                replyToMessageId: Optional("replyToMessageId"),
                forwardMessageId: Optional("forwardMessageId"),
                sendAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                id: "id",
                inboxId: "inboxId",
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                sendStatus: Nullable<DraftSendStatus>.value(DraftSendStatus.scheduled)
            )
        )
        let response = try await client.drafts.update(
            inboxId: "inboxId",
            draftId: "draftId",
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
                  "draft": {
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
                    "subject": "",
                    "text": "text",
                    "html": "html",
                    "headers": {
                      "headers": "headers"
                    },
                    "attachments": [
                      {
                        "filename": "x",
                        "contentType": {
                          "key": "value"
                        },
                        "content": "content",
                        "contentId": "contentId",
                        "disposition": "attachment"
                      },
                      {
                        "filename": "x",
                        "contentType": {
                          "key": "value"
                        },
                        "content": "content",
                        "contentId": "contentId",
                        "disposition": "attachment"
                      }
                    ],
                    "replyToMessageId": "replyToMessageId",
                    "forwardMessageId": "forwardMessageId",
                    "sendAt": "2024-01-15T09:30:00Z",
                    "id": "id",
                    "inboxId": "inboxId",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "updatedAt": "2024-01-15T09:30:00Z",
                    "sendStatus": "scheduled"
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
        let expectedResponse = UpdateDraftsResponse(
            draft: Draft(
                to: [
                    DraftToItem.string(
                        "to"
                    ),
                    DraftToItem.string(
                        "to"
                    )
                ],
                cc: Optional([
                    DraftCcItem.string(
                        "cc"
                    ),
                    DraftCcItem.string(
                        "cc"
                    )
                ]),
                bcc: Optional([
                    DraftBccItem.string(
                        "bcc"
                    ),
                    DraftBccItem.string(
                        "bcc"
                    )
                ]),
                replyTo: Optional([
                    DraftReplyToItem.string(
                        "replyTo"
                    ),
                    DraftReplyToItem.string(
                        "replyTo"
                    )
                ]),
                subject: Optional(""),
                text: Optional("text"),
                html: Optional("html"),
                headers: Optional([
                    "headers": "headers"
                ]),
                attachments: [
                    DraftAttachmentsItem.draftAttachmentsItemContent(
                        DraftAttachmentsItemContent(
                            filename: "x",
                            contentType: JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            ),
                            content: "content",
                            contentId: Optional("contentId"),
                            disposition: DraftAttachmentsItemContentDisposition.attachment
                        )
                    ),
                    DraftAttachmentsItem.draftAttachmentsItemContent(
                        DraftAttachmentsItemContent(
                            filename: "x",
                            contentType: JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            ),
                            content: "content",
                            contentId: Optional("contentId"),
                            disposition: DraftAttachmentsItemContentDisposition.attachment
                        )
                    )
                ],
                replyToMessageId: Optional("replyToMessageId"),
                forwardMessageId: Optional("forwardMessageId"),
                sendAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                id: "id",
                inboxId: "inboxId",
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                sendStatus: Nullable<DraftSendStatus>.value(DraftSendStatus.scheduled)
            )
        )
        let response = try await client.drafts.update(
            inboxId: "inboxId",
            draftId: "draftId",
            request: .init(),
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
        let expectedResponse = SendDraftsResponse(
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
        let response = try await client.drafts.send(
            inboxId: "inboxId",
            draftId: "draftId",
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
        let expectedResponse = SendDraftsResponse(
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
        let response = try await client.drafts.send(
            inboxId: "inboxId",
            draftId: "draftId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}