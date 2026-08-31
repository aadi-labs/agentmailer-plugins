# frozen_string_literal: true

module AgentMailer
  module Types
    class A2AAgentCardProvider < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false

      field :organization, -> { String }, optional: false, nullable: false
    end
  end
end
