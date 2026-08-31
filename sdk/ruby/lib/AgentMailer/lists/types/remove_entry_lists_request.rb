# frozen_string_literal: true

module AgentMailer
  module Lists
    module Types
      class RemoveEntryListsRequest < Internal::Types::Model
        field :list_id, -> { String }, optional: false, nullable: false, api_name: "listId"

        field :address_pattern, -> { String }, optional: true, nullable: false
      end
    end
  end
end
