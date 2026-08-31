# frozen_string_literal: true

module AgentMailer
  module Types
    class ThreadParticipantsItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::ThreadParticipantsItemAddress }
    end
  end
end
