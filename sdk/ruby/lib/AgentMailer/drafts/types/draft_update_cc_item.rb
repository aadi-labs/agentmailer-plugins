# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class DraftUpdateCcItem < Internal::Types::Model
        extend AgentMailer::Internal::Types::Union

        member -> { String }

        member -> { AgentMailer::Drafts::Types::DraftUpdateCcItemAddress }
      end
    end
  end
end
