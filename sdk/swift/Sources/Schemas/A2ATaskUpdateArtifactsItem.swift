import Foundation

public struct A2ATaskUpdateArtifactsItem: Codable, Hashable, Sendable {
    public let artifactId: String
    public let name: String?
    public let description: String?
    public let parts: [A2ATaskUpdateArtifactsItemPartsItem]
    public let metadata: [String: JSONValue]?
    public let extensions: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        artifactId: String,
        name: String? = nil,
        description: String? = nil,
        parts: [A2ATaskUpdateArtifactsItemPartsItem],
        metadata: [String: JSONValue]? = nil,
        extensions: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.artifactId = artifactId
        self.name = name
        self.description = description
        self.parts = parts
        self.metadata = metadata
        self.extensions = extensions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.artifactId = try container.decode(String.self, forKey: .artifactId)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.parts = try container.decode([A2ATaskUpdateArtifactsItemPartsItem].self, forKey: .parts)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
        self.extensions = try container.decodeIfPresent([String].self, forKey: .extensions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.artifactId, forKey: .artifactId)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.parts, forKey: .parts)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.extensions, forKey: .extensions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case artifactId
        case name
        case description
        case parts
        case metadata
        case extensions
    }
}