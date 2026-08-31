# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class DraftCreateReplyToItem < Internal::Types::Model
        extend AgentMailer::Internal::Types::Union

        member -> { String }

        member -> { AgentMailer::Drafts::Types::DraftCreateReplyToItemAddress }
      end
    end
  end
end
