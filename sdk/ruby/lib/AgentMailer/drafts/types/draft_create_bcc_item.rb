# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class DraftCreateBccItem < Internal::Types::Model
        extend AgentMailer::Internal::Types::Union

        member -> { String }

        member -> { AgentMailer::Drafts::Types::DraftCreateBccItemAddress }
      end
    end
  end
end
