import Foundation
import Testing
import AgentMailer

@Suite("DomainsClient Wire Tests") struct DomainsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "domains": [
                    {
                      "id": "id",
                      "podId": "podId",
                      "domain": "domain",
                      "status": "pending",
                      "records": [
                        {
                          "type": "CNAME",
                          "name": "name",
                          "value": "value"
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
        let expectedResponse = ListDomainsResponse(
            domains: [
                Domain(
                    id: "id",
                    podId: Nullable<String>.value("podId"),
                    domain: "domain",
                    status: DomainStatus.pending,
                    records: [
                        DomainRecordsItem(
                            type: DomainRecordsItemType.cname,
                            name: "name",
                            value: "value"
                        )
                    ],
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ]
        )
        let response = try await client.domains.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "domains": [
                    {
                      "id": "id",
                      "podId": "podId",
                      "domain": "domain",
                      "status": "pending",
                      "records": [
                        {
                          "type": "CNAME",
                          "name": "x",
                          "value": "x",
                          "priority": 65535
                        },
                        {
                          "type": "CNAME",
                          "name": "x",
                          "value": "x",
                          "priority": 65535
                        }
                      ],
                      "createdAt": "2024-01-15T09:30:00Z",
                      "updatedAt": "2024-01-15T09:30:00Z"
                    },
                    {
                      "id": "id",
                      "podId": "podId",
                      "domain": "domain",
                      "status": "pending",
                      "records": [
                        {
                          "type": "CNAME",
                          "name": "x",
                          "value": "x",
                          "priority": 65535
                        },
                        {
                          "type": "CNAME",
                          "name": "x",
                          "value": "x",
                          "priority": 65535
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
        let expectedResponse = ListDomainsResponse(
            domains: [
                Domain(
                    id: "id",
                    podId: Nullable<String>.value("podId"),
                    domain: "domain",
                    status: DomainStatus.pending,
                    records: [
                        DomainRecordsItem(
                            type: DomainRecordsItemType.cname,
                            name: "x",
                            value: "x",
                            priority: Optional(65535)
                        ),
                        DomainRecordsItem(
                            type: DomainRecordsItemType.cname,
                            name: "x",
                            value: "x",
                            priority: Optional(65535)
                        )
                    ],
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                ),
                Domain(
                    id: "id",
                    podId: Nullable<String>.value("podId"),
                    domain: "domain",
                    status: DomainStatus.pending,
                    records: [
                        DomainRecordsItem(
                            type: DomainRecordsItemType.cname,
                            name: "x",
                            value: "x",
                            priority: Optional(65535)
                        ),
                        DomainRecordsItem(
                            type: DomainRecordsItemType.cname,
                            name: "x",
                            value: "x",
                            priority: Optional(65535)
                        )
                    ],
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ]
        )
        let response = try await client.domains.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "domain": {
                    "id": "id",
                    "podId": "podId",
                    "domain": "domain",
                    "status": "pending",
                    "records": [
                      {
                        "type": "CNAME",
                        "name": "name",
                        "value": "value"
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
        let expectedResponse = CreateDomainsResponse(
            domain: Domain(
                id: "id",
                podId: Nullable<String>.value("podId"),
                domain: "domain",
                status: DomainStatus.pending,
                records: [
                    DomainRecordsItem(
                        type: DomainRecordsItemType.cname,
                        name: "name",
                        value: "value"
                    )
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.domains.create(
            request: .init(domain: "domain"),
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
                  "domain": {
                    "id": "id",
                    "podId": "podId",
                    "domain": "domain",
                    "status": "pending",
                    "records": [
                      {
                        "type": "CNAME",
                        "name": "x",
                        "value": "x",
                        "priority": 65535
                      },
                      {
                        "type": "CNAME",
                        "name": "x",
                        "value": "x",
                        "priority": 65535
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
        let expectedResponse = CreateDomainsResponse(
            domain: Domain(
                id: "id",
                podId: Nullable<String>.value("podId"),
                domain: "domain",
                status: DomainStatus.pending,
                records: [
                    DomainRecordsItem(
                        type: DomainRecordsItemType.cname,
                        name: "x",
                        value: "x",
                        priority: Optional(65535)
                    ),
                    DomainRecordsItem(
                        type: DomainRecordsItemType.cname,
                        name: "x",
                        value: "x",
                        priority: Optional(65535)
                    )
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.domains.create(
            request: .init(domain: "domain"),
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
                  "domain": {
                    "id": "id",
                    "podId": "podId",
                    "domain": "domain",
                    "status": "pending",
                    "records": [
                      {
                        "type": "CNAME",
                        "name": "name",
                        "value": "value"
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
        let expectedResponse = GetDomainsResponse(
            domain: Domain(
                id: "id",
                podId: Nullable<String>.value("podId"),
                domain: "domain",
                status: DomainStatus.pending,
                records: [
                    DomainRecordsItem(
                        type: DomainRecordsItemType.cname,
                        name: "name",
                        value: "value"
                    )
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.domains.get(
            domainId: "domainId",
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
                  "domain": {
                    "id": "id",
                    "podId": "podId",
                    "domain": "domain",
                    "status": "pending",
                    "records": [
                      {
                        "type": "CNAME",
                        "name": "x",
                        "value": "x",
                        "priority": 65535
                      },
                      {
                        "type": "CNAME",
                        "name": "x",
                        "value": "x",
                        "priority": 65535
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
        let expectedResponse = GetDomainsResponse(
            domain: Domain(
                id: "id",
                podId: Nullable<String>.value("podId"),
                domain: "domain",
                status: DomainStatus.pending,
                records: [
                    DomainRecordsItem(
                        type: DomainRecordsItemType.cname,
                        name: "x",
                        value: "x",
                        priority: Optional(65535)
                    ),
                    DomainRecordsItem(
                        type: DomainRecordsItemType.cname,
                        name: "x",
                        value: "x",
                        priority: Optional(65535)
                    )
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.domains.get(
            domainId: "domainId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func verify1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "domain": {
                    "id": "id",
                    "podId": "podId",
                    "domain": "domain",
                    "status": "pending",
                    "records": [
                      {
                        "type": "CNAME",
                        "name": "name",
                        "value": "value"
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
        let expectedResponse = VerifyDomainsResponse(
            domain: Domain(
                id: "id",
                podId: Nullable<String>.value("podId"),
                domain: "domain",
                status: DomainStatus.pending,
                records: [
                    DomainRecordsItem(
                        type: DomainRecordsItemType.cname,
                        name: "name",
                        value: "value"
                    )
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.domains.verify(
            domainId: "domainId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func verify2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "domain": {
                    "id": "id",
                    "podId": "podId",
                    "domain": "domain",
                    "status": "pending",
                    "records": [
                      {
                        "type": "CNAME",
                        "name": "x",
                        "value": "x",
                        "priority": 65535
                      },
                      {
                        "type": "CNAME",
                        "name": "x",
                        "value": "x",
                        "priority": 65535
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
        let expectedResponse = VerifyDomainsResponse(
            domain: Domain(
                id: "id",
                podId: Nullable<String>.value("podId"),
                domain: "domain",
                status: DomainStatus.pending,
                records: [
                    DomainRecordsItem(
                        type: DomainRecordsItemType.cname,
                        name: "x",
                        value: "x",
                        priority: Optional(65535)
                    ),
                    DomainRecordsItem(
                        type: DomainRecordsItemType.cname,
                        name: "x",
                        value: "x",
                        priority: Optional(65535)
                    )
                ],
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
            )
        )
        let response = try await client.domains.verify(
            domainId: "domainId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}