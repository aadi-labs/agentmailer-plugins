# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class DraftUpdateToItem < Internal::Types::Model
        extend AgentMailer::Internal::Types::Union

        member -> { String }

        member -> { AgentMailer::Drafts::Types::DraftUpdateToItemAddress }
      end
    end
  end
end
