# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class DraftCreateCcItem < Internal::Types::Model
        extend AgentMailer::Internal::Types::Union

        member -> { String }

        member -> { AgentMailer::Drafts::Types::DraftCreateCcItemAddress }
      end
    end
  end
end
