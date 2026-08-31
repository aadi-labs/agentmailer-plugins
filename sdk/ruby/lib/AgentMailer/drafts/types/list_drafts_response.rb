# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class ListDraftsResponse < Internal::Types::Model
        field :drafts, -> { Internal::Types::Array[AgentMailer::Types::Draft] }, optional: false, nullable: false
      end
    end
  end
end
