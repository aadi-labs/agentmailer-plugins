import Foundation

public struct SignUpAgentResponse: Codable, Hashable, Sendable {
    public let status: SignUpAgentResponseStatus
    public let username: String
    public let requestedEmailAddress: String
    public let approvalUrl: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: SignUpAgentResponseStatus,
        username: String,
        requestedEmailAddress: String,
        approvalUrl: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.username = username
        self.requestedEmailAddress = requestedEmailAddress
        self.approvalUrl = approvalUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(SignUpAgentResponseStatus.self, forKey: .status)
        self.username = try container.decode(String.self, forKey: .username)
        self.requestedEmailAddress = try container.decode(String.self, forKey: .requestedEmailAddress)
        self.approvalUrl = try container.decode(String.self, forKey: .approvalUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.username, forKey: .username)
        try container.encode(self.requestedEmailAddress, forKey: .requestedEmailAddress)
        try container.encode(self.approvalUrl, forKey: .approvalUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case username
        case requestedEmailAddress
        case approvalUrl
    }
}