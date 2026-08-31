import Foundation

public struct A2ATask: Codable, Hashable, Sendable {
    public let id: String
    public let contextId: String
    public let status: A2ATaskStatus
    public let artifacts: [A2ATaskArtifactsItem]?
    public let history: [A2ATaskHistoryItem]?
    public let metadata: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        contextId: String,
        status: A2ATaskStatus,
        artifacts: [A2ATaskArtifactsItem]? = nil,
        history: [A2ATaskHistoryItem]? = nil,
        metadata: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.contextId = contextId
        self.status = status
        self.artifacts = artifacts
        self.history = history
        self.metadata = metadata
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.contextId = try container.decode(String.self, forKey: .contextId)
        self.status = try container.decode(A2ATaskStatus.self, forKey: .status)
        self.artifacts = try container.decodeIfPresent([A2ATaskArtifactsItem].self, forKey: .artifacts)
        self.history = try container.decodeIfPresent([A2ATaskHistoryItem].self, forKey: .history)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.contextId, forKey: .contextId)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.artifacts, forKey: .artifacts)
        try container.encodeIfPresent(self.history, forKey: .history)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case contextId
        case status
        case artifacts
        case history
        case metadata
    }
}