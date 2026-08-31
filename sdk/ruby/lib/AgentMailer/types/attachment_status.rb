# frozen_string_literal: true

module AgentMailer
  module Types
    module AttachmentStatus
      extend AgentMailer::Internal::Types::Enum

      PENDING = "pending"
      UPLOADED = "uploaded"
      COMMITTED = "committed"
    end
  end
end
