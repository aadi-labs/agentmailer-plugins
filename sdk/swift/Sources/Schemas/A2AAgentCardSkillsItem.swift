import Foundation

public struct A2AAgentCardSkillsItem: Codable, Hashable, Sendable {
    public let id: String
    public let name: String
    public let description: String
    public let tags: [String]
    public let examples: [String]?
    public let inputModes: [String]?
    public let outputModes: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        description: String,
        tags: [String],
        examples: [String]? = nil,
        inputModes: [String]? = nil,
        outputModes: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.tags = tags
        self.examples = examples
        self.inputModes = inputModes
        self.outputModes = outputModes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.examples = try container.decodeIfPresent([String].self, forKey: .examples)
        self.inputModes = try container.decodeIfPresent([String].self, forKey: .inputModes)
        self.outputModes = try container.decodeIfPresent([String].self, forKey: .outputModes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.tags, forKey: .tags)
        try container.encodeIfPresent(self.examples, forKey: .examples)
        try container.encodeIfPresent(self.inputModes, forKey: .inputModes)
        try container.encodeIfPresent(self.outputModes, forKey: .outputModes)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case description
        case tags
        case examples
        case inputModes
        case outputModes
    }
}