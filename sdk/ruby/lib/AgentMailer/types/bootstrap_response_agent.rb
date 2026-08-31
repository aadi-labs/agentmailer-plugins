# frozen_string_literal: true

module AgentMailer
  module Types
    class BootstrapResponseAgent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :trust_tier, -> { AgentMailer::Types::BootstrapResponseAgentTrustTier }, optional: false, nullable: false, api_name: "trustTier"
    end
  end
end
