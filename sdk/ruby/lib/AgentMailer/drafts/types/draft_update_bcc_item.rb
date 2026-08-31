# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class DraftUpdateBccItem < Internal::Types::Model
        extend AgentMailer::Internal::Types::Union

        member -> { String }

        member -> { AgentMailer::Drafts::Types::DraftUpdateBccItemAddress }
      end
    end
  end
end
