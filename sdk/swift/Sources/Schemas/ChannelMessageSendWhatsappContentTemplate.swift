import Foundation

public struct ChannelMessageSendWhatsappContentTemplate: Codable, Hashable, Sendable {
    public let name: String
    public let languageCode: String
    public let components: [[String: JSONValue]]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        languageCode: String,
        components: [[String: JSONValue]]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.languageCode = languageCode
        self.components = components
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.languageCode = try container.decode(String.self, forKey: .languageCode)
        self.components = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .components)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.languageCode, forKey: .languageCode)
        try container.encodeIfPresent(self.components, forKey: .components)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case languageCode
        case components
    }
}