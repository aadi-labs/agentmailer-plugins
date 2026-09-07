import Foundation

public struct ChannelMessageSafety: Codable, Hashable, Sendable {
    public let action: ChannelMessageSafetyAction
    public let risk: ChannelMessageSafetyRisk
    public let score: Double
    public let signals: [String]
    public let classifier: ChannelMessageSafetyClassifier
    public let modelStatus: ChannelMessageSafetyModelStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: ChannelMessageSafetyAction,
        risk: ChannelMessageSafetyRisk,
        score: Double,
        signals: [String],
        classifier: ChannelMessageSafetyClassifier,
        modelStatus: ChannelMessageSafetyModelStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.risk = risk
        self.score = score
        self.signals = signals
        self.classifier = classifier
        self.modelStatus = modelStatus
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(ChannelMessageSafetyAction.self, forKey: .action)
        self.risk = try container.decode(ChannelMessageSafetyRisk.self, forKey: .risk)
        self.score = try container.decode(Double.self, forKey: .score)
        self.signals = try container.decode([String].self, forKey: .signals)
        self.classifier = try container.decode(ChannelMessageSafetyClassifier.self, forKey: .classifier)
        self.modelStatus = try container.decode(ChannelMessageSafetyModelStatus.self, forKey: .modelStatus)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.risk, forKey: .risk)
        try container.encode(self.score, forKey: .score)
        try container.encode(self.signals, forKey: .signals)
        try container.encode(self.classifier, forKey: .classifier)
        try container.encode(self.modelStatus, forKey: .modelStatus)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case risk
        case score
        case signals
        case classifier
        case modelStatus
    }
}