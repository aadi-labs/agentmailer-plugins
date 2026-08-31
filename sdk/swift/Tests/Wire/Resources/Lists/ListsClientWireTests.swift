import Foundation
import Testing
import AgentMailer

@Suite("ListsClient Wire Tests") struct ListsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "lists": [
                    {
                      "podId": "podId",
                      "name": "name",
                      "kind": "allow",
                      "id": "id",
                      "entries": [],
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
        let expectedResponse = ListListsResponse(
            lists: [
                List(
                    podId: "podId",
                    name: "name",
                    kind: ListKind.allow,
                    id: "id",
                    entries: [],
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ]
        )
        let response = try await client.lists.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "lists": [
                    {
                      "podId": "podId",
                      "name": "x",
                      "kind": "allow",
                      "id": "id",
                      "entries": [
                        {
                          "addressPattern": {
                            "key": "value"
                          },
                          "note": "note"
                        },
                        {
                          "addressPattern": {
                            "key": "value"
                          },
                          "note": "note"
                        }
                      ],
                      "createdAt": "2024-01-15T09:30:00Z",
                      "updatedAt": "2024-01-15T09:30:00Z"
                    },
                    {
                      "podId": "podId",
                      "name": "x",
                      "kind": "allow",
                      "id": "id",
                      "entries": [
                        {
                          "addressPattern": {
                            "key": "value"
                          },
                          "note": "note"
                        },
                        {
                          "addressPattern": {
                            "key": "value"
                          },
                          "note": "note"
                        }
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
        let expectedResponse = ListListsResponse(
            lists: [
                List(
                    podId: "podId",
                    name: "x",
                    kind: ListKind.allow,
                    id: "id",
                    entries: [
                        ListEntriesItem(
                            addressPattern: JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            ),
                            note: Optional("note")
                        ),
                        ListEntriesItem(
                            addressPattern: JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            ),
                            note: Optional("note")
                        )
                    ],
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                ),
                List(
                    podId: "podId",
                    name: "x",
                    kind: ListKind.allow,
                    id: "id",
                    entries: [
                        ListEntriesItem(
                            addressPattern: JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            ),
                            note: Optional("note")
                        ),
                        ListEntriesItem(
                            addressPattern: JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            ),
                            note: Optional("note")
                        )
                    ],
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ]
        )
        let response = try await client.lists.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "list": {
                    "podId": "podId",
                    "name": "name",
                    "kind": "allow",
                    "id": "id",
                    "entries": [],
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
        let expectedResponse = CreateListsResponse(
            list: List(
                podId: "podId",
                name: "name",
                kind: ListKind.allow,
                id: "id",
                entries: [],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.lists.create(
            request: .init(
                podId: "podId",
                name: "name",
                kind: .allow
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
                  "list": {
                    "podId": "podId",
                    "name": "x",
                    "kind": "allow",
                    "id": "id",
                    "entries": [
                      {
                        "addressPattern": {
                          "key": "value"
                        },
                        "note": "note"
                      },
                      {
                        "addressPattern": {
                          "key": "value"
                        },
                        "note": "note"
                      }
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
        let expectedResponse = CreateListsResponse(
            list: List(
                podId: "podId",
                name: "x",
                kind: ListKind.allow,
                id: "id",
                entries: [
                    ListEntriesItem(
                        addressPattern: JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        ),
                        note: Optional("note")
                    ),
                    ListEntriesItem(
                        addressPattern: JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        ),
                        note: Optional("note")
                    )
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.lists.create(
            request: .init(
                podId: "podId",
                name: "x",
                kind: .allow
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func addEntry1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "list": {
                    "podId": "podId",
                    "name": "name",
                    "kind": "allow",
                    "id": "id",
                    "entries": [],
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
        let expectedResponse = AddEntryListsResponse(
            list: List(
                podId: "podId",
                name: "name",
                kind: ListKind.allow,
                id: "id",
                entries: [],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.lists.addEntry(
            listId: "listId",
            request: .init(addressPattern: "addressPattern"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func addEntry2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "list": {
                    "podId": "podId",
                    "name": "x",
                    "kind": "allow",
                    "id": "id",
                    "entries": [
                      {
                        "addressPattern": {
                          "key": "value"
                        },
                        "note": "note"
                      },
                      {
                        "addressPattern": {
                          "key": "value"
                        },
                        "note": "note"
                      }
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
        let expectedResponse = AddEntryListsResponse(
            list: List(
                podId: "podId",
                name: "x",
                kind: ListKind.allow,
                id: "id",
                entries: [
                    ListEntriesItem(
                        addressPattern: JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        ),
                        note: Optional("note")
                    ),
                    ListEntriesItem(
                        addressPattern: JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        ),
                        note: Optional("note")
                    )
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.lists.addEntry(
            listId: "listId",
            request: .init(addressPattern: "foo"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func removeEntry1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "list": {
                    "podId": "podId",
                    "name": "name",
                    "kind": "allow",
                    "id": "id",
                    "entries": [],
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
        let expectedResponse = RemoveEntryListsResponse(
            list: List(
                podId: "podId",
                name: "name",
                kind: ListKind.allow,
                id: "id",
                entries: [],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.lists.removeEntry(
            listId: "listId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func removeEntry2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "list": {
                    "podId": "podId",
                    "name": "x",
                    "kind": "allow",
                    "id": "id",
                    "entries": [
                      {
                        "addressPattern": {
                          "key": "value"
                        },
                        "note": "note"
                      },
                      {
                        "addressPattern": {
                          "key": "value"
                        },
                        "note": "note"
                      }
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
        let expectedResponse = RemoveEntryListsResponse(
            list: List(
                podId: "podId",
                name: "x",
                kind: ListKind.allow,
                id: "id",
                entries: [
                    ListEntriesItem(
                        addressPattern: JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        ),
                        note: Optional("note")
                    ),
                    ListEntriesItem(
                        addressPattern: JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        ),
                        note: Optional("note")
                    )
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.lists.removeEntry(
            listId: "listId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}