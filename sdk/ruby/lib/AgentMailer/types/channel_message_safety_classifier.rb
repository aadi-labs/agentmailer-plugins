# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelMessageSafetyClassifier
      extend AgentMailer::Internal::Types::Enum

      LOCAL = "local"
      LOCAL_OPENAI_GUARDRAILS = "local+openai-guardrails"
    end
  end
end
