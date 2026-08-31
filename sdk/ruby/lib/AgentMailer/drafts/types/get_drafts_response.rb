# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class GetDraftsResponse < Internal::Types::Model
        field :draft, -> { AgentMailer::Types::Draft }, optional: false, nullable: false
      end
    end
  end
end
