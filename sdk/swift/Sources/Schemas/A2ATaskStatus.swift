import Foundation

public struct A2ATaskStatus: Codable, Hashable, Sendable {
    public let state: A2ATaskStatusState
    public let timestamp: Date
    public let message: A2ATaskStatusMessage?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        state: A2ATaskStatusState,
        timestamp: Date,
        message: A2ATaskStatusMessage? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.state = state
        self.timestamp = timestamp
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.state = try container.decode(A2ATaskStatusState.self, forKey: .state)
        self.timestamp = try container.decode(Date.self, forKey: .timestamp)
        self.message = try container.decodeIfPresent(A2ATaskStatusMessage.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.state, forKey: .state)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case state
        case timestamp
        case message
    }
}