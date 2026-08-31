import Foundation
import Testing
import AgentMailer

@Suite("EventsClient Wire Tests") struct EventsClientWireTests {
    @Test func createTicket1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "ticket": "ticket",
                  "expiresIn": 1,
                  "websocketUrl": "websocketUrl"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateTicketEventsResponse(
            ticket: "ticket",
            expiresIn: 1,
            websocketUrl: "websocketUrl"
        )
        let response = try await client.events.createTicket(
            request: .init(podId: "podId"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func createTicket2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "ticket": "ticket",
                  "expiresIn": 1,
                  "websocketUrl": "websocketUrl"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateTicketEventsResponse(
            ticket: "ticket",
            expiresIn: 1,
            websocketUrl: "websocketUrl"
        )
        let response = try await client.events.createTicket(
            request: .init(podId: "podId"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}