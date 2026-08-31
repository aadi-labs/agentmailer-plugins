import Foundation

public struct A2ATaskStatusMessage: Codable, Hashable, Sendable {
    public let messageId: String
    public let contextId: String?
    public let taskId: String?
    public let role: A2ATaskStatusMessageRole
    public let parts: [A2ATaskStatusMessagePartsItem]
    public let metadata: [String: JSONValue]?
    public let extensions: [String]?
    public let referenceTaskIds: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        messageId: String,
        contextId: String? = nil,
        taskId: String? = nil,
        role: A2ATaskStatusMessageRole,
        parts: [A2ATaskStatusMessagePartsItem],
        metadata: [String: JSONValue]? = nil,
        extensions: [String]? = nil,
        referenceTaskIds: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messageId = messageId
        self.contextId = contextId
        self.taskId = taskId
        self.role = role
        self.parts = parts
        self.metadata = metadata
        self.extensions = extensions
        self.referenceTaskIds = referenceTaskIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messageId = try container.decode(String.self, forKey: .messageId)
        self.contextId = try container.decodeIfPresent(String.self, forKey: .contextId)
        self.taskId = try container.decodeIfPresent(String.self, forKey: .taskId)
        self.role = try container.decode(A2ATaskStatusMessageRole.self, forKey: .role)
        self.parts = try container.decode([A2ATaskStatusMessagePartsItem].self, forKey: .parts)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
        self.extensions = try container.decodeIfPresent([String].self, forKey: .extensions)
        self.referenceTaskIds = try container.decodeIfPresent([String].self, forKey: .referenceTaskIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.messageId, forKey: .messageId)
        try container.encodeIfPresent(self.contextId, forKey: .contextId)
        try container.encodeIfPresent(self.taskId, forKey: .taskId)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.parts, forKey: .parts)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.extensions, forKey: .extensions)
        try container.encodeIfPresent(self.referenceTaskIds, forKey: .referenceTaskIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messageId
        case contextId
        case taskId
        case role
        case parts
        case metadata
        case extensions
        case referenceTaskIds
    }
}