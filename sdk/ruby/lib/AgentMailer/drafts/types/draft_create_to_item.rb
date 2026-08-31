# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class DraftCreateToItem < Internal::Types::Model
        extend AgentMailer::Internal::Types::Union

        member -> { String }

        member -> { AgentMailer::Drafts::Types::DraftCreateToItemAddress }
      end
    end
  end
end
