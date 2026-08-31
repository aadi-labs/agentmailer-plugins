# frozen_string_literal: true

module AgentMailer
  module Lists
    module Types
      class RemoveEntryListsResponse < Internal::Types::Model
        field :list, -> { AgentMailer::Types::List }, optional: false, nullable: false
      end
    end
  end
end
