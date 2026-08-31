# frozen_string_literal: true

module AgentMailer
  module Types
    class ReplyComposeBccItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::ReplyComposeBccItemAddress }
    end
  end
end
