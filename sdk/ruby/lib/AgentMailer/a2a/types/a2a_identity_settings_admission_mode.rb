# frozen_string_literal: true

module AgentMailer
  module A2A
    module Types
      module A2AIdentitySettingsAdmissionMode
        extend AgentMailer::Internal::Types::Enum

        WHITELIST = "whitelist"
        PUBLIC = "public"
      end
    end
  end
end
