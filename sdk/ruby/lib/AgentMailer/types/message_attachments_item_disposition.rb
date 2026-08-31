# frozen_string_literal: true

module AgentMailer
  module Types
    module MessageAttachmentsItemDisposition
      extend AgentMailer::Internal::Types::Enum

      ATTACHMENT = "attachment"
      INLINE = "inline"
    end
  end
end
