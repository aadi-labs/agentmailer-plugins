# frozen_string_literal: true

module AgentMailer
  module Lists
    module Types
      class ListListsResponse < Internal::Types::Model
        field :lists, -> { Internal::Types::Array[AgentMailer::Types::List] }, optional: false, nullable: false
      end
    end
  end
end
