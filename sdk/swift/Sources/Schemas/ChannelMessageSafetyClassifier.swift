import Foundation

public enum ChannelMessageSafetyClassifier: String, Codable, Hashable, CaseIterable, Sendable {
    case local
    case localOpenaiGuardrails = "local+openai-guardrails"
}