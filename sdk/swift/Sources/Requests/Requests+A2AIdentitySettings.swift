import Foundation

extension Requests {
    public struct A2AIdentitySettings: Codable, Hashable, Sendable {
        public let publiclyDiscoverable: Bool?
        public let admissionMode: A2AIdentitySettingsAdmissionMode?
        public let name: String?
        public let description: String?
        public let skills: [A2AIdentitySettingsSkillsItem]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            publiclyDiscoverable: Bool? = nil,
            admissionMode: A2AIdentitySettingsAdmissionMode? = nil,
            name: String? = nil,
            description: String? = nil,
            skills: [A2AIdentitySettingsSkillsItem]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.publiclyDiscoverable = publiclyDiscoverable
            self.admissionMode = admissionMode
            self.name = name
            self.description = description
            self.skills = skills
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.publiclyDiscoverable = try container.decodeIfPresent(Bool.self, forKey: .publiclyDiscoverable)
            self.admissionMode = try container.decodeIfPresent(A2AIdentitySettingsAdmissionMode.self, forKey: .admissionMode)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.skills = try container.decodeIfPresent([A2AIdentitySettingsSkillsItem].self, forKey: .skills)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.publiclyDiscoverable, forKey: .publiclyDiscoverable)
            try container.encodeIfPresent(self.admissionMode, forKey: .admissionMode)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.description, forKey: .description)
            try container.encodeIfPresent(self.skills, forKey: .skills)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case publiclyDiscoverable
            case admissionMode
            case name
            case description
            case skills
        }
    }
}