# frozen_string_literal: true

module AgentMailer
  module Types
    module MessageComposeAttachmentsItemContentDisposition
      extend AgentMailer::Internal::Types::Enum

      ATTACHMENT = "attachment"
      INLINE = "inline"
    end
  end
end
