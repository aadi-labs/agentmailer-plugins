import Foundation
import Testing
import AgentMailer

@Suite("AgentClient Wire Tests") struct AgentClientWireTests {
    @Test func bootstrap1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "agent": {
                    "id": "id",
                    "trustTier": "bootstrap"
                  },
                  "identity": {
                    "id": "id",
                    "handle": "handle",
                    "emailAddress": "emailAddress"
                  },
                  "organization": {
                    "id": "id"
                  },
                  "pod": {
                    "id": "id",
                    "name": "name"
                  },
                  "inbox": {
                    "id": "id",
                    "address": "address",
                    "status": "active"
                  },
                  "capabilities": {
                    "receive": true,
                    "send": true,
                    "imap": true,
                    "smtp": true,
                    "customDomains": true,
                    "a2a": true
                  },
                  "limits": {
                    "messagesPerDay": 1,
                    "recipientsPerMessage": 1,
                    "attachmentBytes": 1
                  },
                  "links": {
                    "inbox": "inbox",
                    "messages": "messages",
                    "events": "events",
                    "imap": "imap",
                    "smtp": "smtp",
                    "a2a": "a2a",
                    "agentCard": "agentCard"
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
        let expectedResponse = BootstrapResponse(
            agent: BootstrapResponseAgent(
                id: "id",
                trustTier: BootstrapResponseAgentTrustTier.bootstrap
            ),
            identity: BootstrapResponseIdentity(
                id: "id",
                handle: "handle",
                emailAddress: "emailAddress"
            ),
            organization: BootstrapResponseOrganization(
                id: "id"
            ),
            pod: BootstrapResponsePod(
                id: "id",
                name: "name"
            ),
            inbox: BootstrapResponseInbox(
                id: "id",
                address: "address",
                status: BootstrapResponseInboxStatus.active
            ),
            capabilities: BootstrapResponseCapabilities(
                receive: true,
                send: true,
                imap: true,
                smtp: true,
                customDomains: true,
                a2A: true
            ),
            limits: BootstrapResponseLimits(
                messagesPerDay: 1,
                recipientsPerMessage: 1,
                attachmentBytes: 1
            ),
            links: BootstrapResponseLinks(
                inbox: "inbox",
                messages: "messages",
                events: "events",
                imap: "imap",
                smtp: "smtp",
                a2A: "a2a",
                agentCard: "agentCard"
            )
        )
        let response = try await client.agent.bootstrap(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func bootstrap2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "agent": {
                    "id": "id",
                    "trustTier": "bootstrap"
                  },
                  "identity": {
                    "id": "id",
                    "handle": "foo",
                    "emailAddress": "emailAddress"
                  },
                  "organization": {
                    "id": "id"
                  },
                  "pod": {
                    "id": "id",
                    "name": "x"
                  },
                  "inbox": {
                    "id": "id",
                    "address": "address",
                    "status": "active"
                  },
                  "capabilities": {
                    "receive": true,
                    "send": true,
                    "imap": true,
                    "smtp": true,
                    "customDomains": true,
                    "a2a": true
                  },
                  "limits": {
                    "messagesPerDay": 1,
                    "recipientsPerMessage": 1,
                    "attachmentBytes": 1
                  },
                  "links": {
                    "inbox": "inbox",
                    "messages": "messages",
                    "events": "events",
                    "imap": "imap",
                    "smtp": "smtp",
                    "a2a": "a2a",
                    "agentCard": "agentCard"
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
        let expectedResponse = BootstrapResponse(
            agent: BootstrapResponseAgent(
                id: "id",
                trustTier: BootstrapResponseAgentTrustTier.bootstrap
            ),
            identity: BootstrapResponseIdentity(
                id: "id",
                handle: "foo",
                emailAddress: "emailAddress"
            ),
            organization: BootstrapResponseOrganization(
                id: "id"
            ),
            pod: BootstrapResponsePod(
                id: "id",
                name: "x"
            ),
            inbox: BootstrapResponseInbox(
                id: "id",
                address: "address",
                status: BootstrapResponseInboxStatus.active
            ),
            capabilities: BootstrapResponseCapabilities(
                receive: true,
                send: true,
                imap: true,
                smtp: true,
                customDomains: true,
                a2A: true
            ),
            limits: BootstrapResponseLimits(
                messagesPerDay: 1,
                recipientsPerMessage: 1,
                attachmentBytes: 1
            ),
            links: BootstrapResponseLinks(
                inbox: "inbox",
                messages: "messages",
                events: "events",
                imap: "imap",
                smtp: "smtp",
                a2A: "a2a",
                agentCard: "agentCard"
            )
        )
        let response = try await client.agent.bootstrap(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func signUp1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "status": "pending_human_approval",
                  "username": "username",
                  "requestedEmailAddress": "requestedEmailAddress",
                  "approvalUrl": "approvalUrl"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SignUpAgentResponse(
            status: SignUpAgentResponseStatus.pendingHumanApproval,
            username: "username",
            requestedEmailAddress: "requestedEmailAddress",
            approvalUrl: "approvalUrl"
        )
        let response = try await client.agent.signUp(
            request: .init(
                humanEmail: "human_email",
                username: "username"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func signUp2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "status": "pending_human_approval",
                  "username": "username",
                  "requestedEmailAddress": "requestedEmailAddress",
                  "approvalUrl": "approvalUrl"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SignUpAgentResponse(
            status: SignUpAgentResponseStatus.pendingHumanApproval,
            username: "username",
            requestedEmailAddress: "requestedEmailAddress",
            approvalUrl: "approvalUrl"
        )
        let response = try await client.agent.signUp(
            request: .init(
                humanEmail: "human_email",
                username: "foo"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}