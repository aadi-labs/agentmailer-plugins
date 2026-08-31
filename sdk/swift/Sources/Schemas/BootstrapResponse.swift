import Foundation

public struct BootstrapResponse: Codable, Hashable, Sendable {
    public let agent: BootstrapResponseAgent
    public let identity: BootstrapResponseIdentity
    public let organization: BootstrapResponseOrganization
    public let pod: BootstrapResponsePod
    public let inbox: BootstrapResponseInbox
    public let capabilities: BootstrapResponseCapabilities
    public let limits: BootstrapResponseLimits
    public let links: BootstrapResponseLinks
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        agent: BootstrapResponseAgent,
        identity: BootstrapResponseIdentity,
        organization: BootstrapResponseOrganization,
        pod: BootstrapResponsePod,
        inbox: BootstrapResponseInbox,
        capabilities: BootstrapResponseCapabilities,
        limits: BootstrapResponseLimits,
        links: BootstrapResponseLinks,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.agent = agent
        self.identity = identity
        self.organization = organization
        self.pod = pod
        self.inbox = inbox
        self.capabilities = capabilities
        self.limits = limits
        self.links = links
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.agent = try container.decode(BootstrapResponseAgent.self, forKey: .agent)
        self.identity = try container.decode(BootstrapResponseIdentity.self, forKey: .identity)
        self.organization = try container.decode(BootstrapResponseOrganization.self, forKey: .organization)
        self.pod = try container.decode(BootstrapResponsePod.self, forKey: .pod)
        self.inbox = try container.decode(BootstrapResponseInbox.self, forKey: .inbox)
        self.capabilities = try container.decode(BootstrapResponseCapabilities.self, forKey: .capabilities)
        self.limits = try container.decode(BootstrapResponseLimits.self, forKey: .limits)
        self.links = try container.decode(BootstrapResponseLinks.self, forKey: .links)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.agent, forKey: .agent)
        try container.encode(self.identity, forKey: .identity)
        try container.encode(self.organization, forKey: .organization)
        try container.encode(self.pod, forKey: .pod)
        try container.encode(self.inbox, forKey: .inbox)
        try container.encode(self.capabilities, forKey: .capabilities)
        try container.encode(self.limits, forKey: .limits)
        try container.encode(self.links, forKey: .links)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case agent
        case identity
        case organization
        case pod
        case inbox
        case capabilities
        case limits
        case links
    }
}