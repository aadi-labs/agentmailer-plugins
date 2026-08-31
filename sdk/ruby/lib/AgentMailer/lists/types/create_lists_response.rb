# frozen_string_literal: true

module AgentMailer
  module Lists
    module Types
      class CreateListsResponse < Internal::Types::Model
        field :list, -> { AgentMailer::Types::List }, optional: false, nullable: false
      end
    end
  end
end
