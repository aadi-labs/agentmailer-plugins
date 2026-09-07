import Foundation
import Testing
import AgentMailer

@Suite("ChannelRecipientPermissionsClient Wire Tests") struct ChannelRecipientPermissionsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "permissions": [
                    {
                      "endpointId": "endpointId",
                      "channel": "sms",
                      "recipient": "recipient",
                      "status": "consented",
                      "consentBasis": "explicit",
                      "consentReference": "consentReference",
                      "consentCapturedAt": "2024-01-15T09:30:00Z",
                      "optedOutAt": "2024-01-15T09:30:00Z",
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
        let expectedResponse = ListChannelRecipientPermissionsResponse(
            permissions: [
                ChannelRecipientPermission(
                    endpointId: "endpointId",
                    channel: ChannelRecipientPermissionChannel.sms,
                    recipient: "recipient",
                    status: ChannelRecipientPermissionStatus.consented,
                    consentBasis: Nullable<ChannelRecipientPermissionConsentBasis>.value(ChannelRecipientPermissionConsentBasis.explicit),
                    consentReference: Nullable<String>.value("consentReference"),
                    consentCapturedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    optedOutAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ],
            nextPageToken: "nextPageToken"
        )
        let response = try await client.channelRecipientPermissions.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "permissions": [
                    {
                      "endpointId": "endpointId",
                      "channel": "sms",
                      "recipient": "x",
                      "status": "consented",
                      "consentBasis": "explicit",
                      "consentReference": "consentReference",
                      "consentCapturedAt": "2024-01-15T09:30:00Z",
                      "optedOutAt": "2024-01-15T09:30:00Z",
                      "updatedAt": "2024-01-15T09:30:00Z"
                    },
                    {
                      "endpointId": "endpointId",
                      "channel": "sms",
                      "recipient": "x",
                      "status": "consented",
                      "consentBasis": "explicit",
                      "consentReference": "consentReference",
                      "consentCapturedAt": "2024-01-15T09:30:00Z",
                      "optedOutAt": "2024-01-15T09:30:00Z",
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
        let expectedResponse = ListChannelRecipientPermissionsResponse(
            permissions: [
                ChannelRecipientPermission(
                    endpointId: "endpointId",
                    channel: ChannelRecipientPermissionChannel.sms,
                    recipient: "x",
                    status: ChannelRecipientPermissionStatus.consented,
                    consentBasis: Nullable<ChannelRecipientPermissionConsentBasis>.value(ChannelRecipientPermissionConsentBasis.explicit),
                    consentReference: Nullable<String>.value("consentReference"),
                    consentCapturedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    optedOutAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                ),
                ChannelRecipientPermission(
                    endpointId: "endpointId",
                    channel: ChannelRecipientPermissionChannel.sms,
                    recipient: "x",
                    status: ChannelRecipientPermissionStatus.consented,
                    consentBasis: Nullable<ChannelRecipientPermissionConsentBasis>.value(ChannelRecipientPermissionConsentBasis.explicit),
                    consentReference: Nullable<String>.value("consentReference"),
                    consentCapturedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    optedOutAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ],
            nextPageToken: "nextPageToken"
        )
        let response = try await client.channelRecipientPermissions.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}