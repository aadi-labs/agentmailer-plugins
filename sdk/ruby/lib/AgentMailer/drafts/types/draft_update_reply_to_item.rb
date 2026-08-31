# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class DraftUpdateReplyToItem < Internal::Types::Model
        extend AgentMailer::Internal::Types::Union

        member -> { String }

        member -> { AgentMailer::Drafts::Types::DraftUpdateReplyToItemAddress }
      end
    end
  end
end
