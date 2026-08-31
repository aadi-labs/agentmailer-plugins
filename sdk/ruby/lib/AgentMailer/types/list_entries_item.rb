# frozen_string_literal: true

module AgentMailer
  module Types
    class ListEntriesItem < Internal::Types::Model
      field :address_pattern, -> { Object }, optional: false, nullable: false, api_name: "addressPattern"

      field :note, -> { String }, optional: true, nullable: false
    end
  end
end
