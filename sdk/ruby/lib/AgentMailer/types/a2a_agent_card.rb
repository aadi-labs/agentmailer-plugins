# frozen_string_literal: true

module AgentMailer
  module Types
    class A2AAgentCard < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :supported_interfaces, -> { Internal::Types::Array[AgentMailer::Types::A2AAgentCardSupportedInterfacesItem] }, optional: false, nullable: false, api_name: "supportedInterfaces"

      field :provider, -> { AgentMailer::Types::A2AAgentCardProvider }, optional: false, nullable: false

      field :version, -> { String }, optional: false, nullable: false

      field :documentation_url, -> { String }, optional: false, nullable: false, api_name: "documentationUrl"

      field :capabilities, -> { AgentMailer::Types::A2AAgentCardCapabilities }, optional: false, nullable: false

      field :security_schemes, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false, api_name: "securitySchemes"

      field :security_requirements, -> { Internal::Types::Array[Internal::Types::Hash[String, Internal::Types::Array[String]]] }, optional: false, nullable: false, api_name: "securityRequirements"

      field :default_input_modes, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "defaultInputModes"

      field :default_output_modes, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "defaultOutputModes"

      field :skills, -> { Internal::Types::Array[AgentMailer::Types::A2AAgentCardSkillsItem] }, optional: false, nullable: false
    end
  end
end
