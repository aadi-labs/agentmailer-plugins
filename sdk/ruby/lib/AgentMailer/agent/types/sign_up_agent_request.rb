# frozen_string_literal: true

module AgentMailer
  module Agent
    module Types
      class SignUpAgentRequest < Internal::Types::Model
        field :human_email, -> { String }, optional: false, nullable: false

        field :username, -> { String }, optional: false, nullable: false
      end
    end
  end
end
