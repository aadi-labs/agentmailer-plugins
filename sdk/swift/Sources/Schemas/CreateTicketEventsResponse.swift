import Foundation

public struct CreateTicketEventsResponse: Codable, Hashable, Sendable {
    public let ticket: String
    public let expiresIn: Int
    public let websocketUrl: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ticket: String,
        expiresIn: Int,
        websocketUrl: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ticket = ticket
        self.expiresIn = expiresIn
        self.websocketUrl = websocketUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ticket = try container.decode(String.self, forKey: .ticket)
        self.expiresIn = try container.decode(Int.self, forKey: .expiresIn)
        self.websocketUrl = try container.decode(String.self, forKey: .websocketUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.ticket, forKey: .ticket)
        try container.encode(self.expiresIn, forKey: .expiresIn)
        try container.encode(self.websocketUrl, forKey: .websocketUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ticket
        case expiresIn
        case websocketUrl
    }
}