import Foundation

public struct A2AAgentCard: Codable, Hashable, Sendable {
    public let name: String
    public let description: String
    public let supportedInterfaces: [A2AAgentCardSupportedInterfacesItem]
    public let provider: A2AAgentCardProvider
    public let version: String
    public let documentationUrl: String
    public let capabilities: A2AAgentCardCapabilities
    public let securitySchemes: [String: JSONValue]
    public let securityRequirements: [[String: [String]]]
    public let defaultInputModes: [String]
    public let defaultOutputModes: [String]
    public let skills: [A2AAgentCardSkillsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        description: String,
        supportedInterfaces: [A2AAgentCardSupportedInterfacesItem],
        provider: A2AAgentCardProvider,
        version: String,
        documentationUrl: String,
        capabilities: A2AAgentCardCapabilities,
        securitySchemes: [String: JSONValue],
        securityRequirements: [[String: [String]]],
        defaultInputModes: [String],
        defaultOutputModes: [String],
        skills: [A2AAgentCardSkillsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.description = description
        self.supportedInterfaces = supportedInterfaces
        self.provider = provider
        self.version = version
        self.documentationUrl = documentationUrl
        self.capabilities = capabilities
        self.securitySchemes = securitySchemes
        self.securityRequirements = securityRequirements
        self.defaultInputModes = defaultInputModes
        self.defaultOutputModes = defaultOutputModes
        self.skills = skills
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.supportedInterfaces = try container.decode([A2AAgentCardSupportedInterfacesItem].self, forKey: .supportedInterfaces)
        self.provider = try container.decode(A2AAgentCardProvider.self, forKey: .provider)
        self.version = try container.decode(String.self, forKey: .version)
        self.documentationUrl = try container.decode(String.self, forKey: .documentationUrl)
        self.capabilities = try container.decode(A2AAgentCardCapabilities.self, forKey: .capabilities)
        self.securitySchemes = try container.decode([String: JSONValue].self, forKey: .securitySchemes)
        self.securityRequirements = try container.decode([[String: [String]]].self, forKey: .securityRequirements)
        self.defaultInputModes = try container.decode([String].self, forKey: .defaultInputModes)
        self.defaultOutputModes = try container.decode([String].self, forKey: .defaultOutputModes)
        self.skills = try container.decode([A2AAgentCardSkillsItem].self, forKey: .skills)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.supportedInterfaces, forKey: .supportedInterfaces)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.version, forKey: .version)
        try container.encode(self.documentationUrl, forKey: .documentationUrl)
        try container.encode(self.capabilities, forKey: .capabilities)
        try container.encode(self.securitySchemes, forKey: .securitySchemes)
        try container.encode(self.securityRequirements, forKey: .securityRequirements)
        try container.encode(self.defaultInputModes, forKey: .defaultInputModes)
        try container.encode(self.defaultOutputModes, forKey: .defaultOutputModes)
        try container.encode(self.skills, forKey: .skills)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case description
        case supportedInterfaces
        case provider
        case version
        case documentationUrl
        case capabilities
        case securitySchemes
        case securityRequirements
        case defaultInputModes
        case defaultOutputModes
        case skills
    }
}