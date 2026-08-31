import Foundation
import Testing
import AgentMailer

@Suite("BillingClient Wire Tests") struct BillingClientWireTests {
    @Test func get1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "billing": {
                    "plan": "free",
                    "status": "active",
                    "stripeCustomerId": "stripeCustomerId",
                    "stripeSubscriptionId": "stripeSubscriptionId",
                    "currentPeriodEnd": "2024-01-15T09:30:00Z",
                    "inboxLimit": 1,
                    "monthlySendLimit": 1,
                    "customDomainLimit": 1,
                    "billingInterval": "month"
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
        let expectedResponse = GetBillingResponse(
            billing: BillingAccount(
                plan: BillingAccountPlan.free,
                status: BillingAccountStatus.active,
                stripeCustomerId: Nullable<String>.value("stripeCustomerId"),
                stripeSubscriptionId: Nullable<String>.value("stripeSubscriptionId"),
                currentPeriodEnd: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                inboxLimit: Nullable<Int>.value(1),
                monthlySendLimit: Nullable<Int>.value(1),
                customDomainLimit: Nullable<Int>.value(1),
                billingInterval: Nullable<BillingAccountBillingInterval>.value(BillingAccountBillingInterval.month)
            )
        )
        let response = try await client.billing.get(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func get2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "billing": {
                    "plan": "free",
                    "status": "active",
                    "stripeCustomerId": "stripeCustomerId",
                    "stripeSubscriptionId": "stripeSubscriptionId",
                    "currentPeriodEnd": "2024-01-15T09:30:00Z",
                    "inboxLimit": 1,
                    "monthlySendLimit": 1,
                    "customDomainLimit": 1,
                    "billingInterval": "month"
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
        let expectedResponse = GetBillingResponse(
            billing: BillingAccount(
                plan: BillingAccountPlan.free,
                status: BillingAccountStatus.active,
                stripeCustomerId: Nullable<String>.value("stripeCustomerId"),
                stripeSubscriptionId: Nullable<String>.value("stripeSubscriptionId"),
                currentPeriodEnd: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                inboxLimit: Nullable<Int>.value(1),
                monthlySendLimit: Nullable<Int>.value(1),
                customDomainLimit: Nullable<Int>.value(1),
                billingInterval: Nullable<BillingAccountBillingInterval>.value(BillingAccountBillingInterval.month)
            )
        )
        let response = try await client.billing.get(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func createCheckout1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "url": "url"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateCheckoutBillingResponse(
            url: "url"
        )
        let response = try await client.billing.createCheckout(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func createCheckout2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "url": "url"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateCheckoutBillingResponse(
            url: "url"
        )
        let response = try await client.billing.createCheckout(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func createPortal1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "url": "url"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreatePortalBillingResponse(
            url: "url"
        )
        let response = try await client.billing.createPortal(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func createPortal2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "url": "url"
                }
                """#.utf8
            )
        )
        let client = AgentMailer(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreatePortalBillingResponse(
            url: "url"
        )
        let response = try await client.billing.createPortal(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}