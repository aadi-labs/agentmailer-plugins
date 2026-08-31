# frozen_string_literal: true

module AgentMailer
  module Attachments
    module Types
      class CompleteAttachmentsResponse < Internal::Types::Model
        field :attachment, -> { AgentMailer::Types::Attachment }, optional: false, nullable: false
      end
    end
  end
end
