# frozen_string_literal: true

module AgentMailer
  module A2A
    module Types
      class A2AIdentitySettings < Internal::Types::Model
        field :publicly_discoverable, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "publiclyDiscoverable"

        field :admission_mode, -> { AgentMailer::A2A::Types::A2AIdentitySettingsAdmissionMode }, optional: true, nullable: false, api_name: "admissionMode"

        field :name, -> { String }, optional: true, nullable: false

        field :description, -> { String }, optional: true, nullable: false

        field :skills, -> { Internal::Types::Array[AgentMailer::A2A::Types::A2AIdentitySettingsSkillsItem] }, optional: true, nullable: false
      end
    end
  end
end
