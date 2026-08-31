# frozen_string_literal: true

module AgentMailer
  module Lists
    module Types
      class ListListsRequest < Internal::Types::Model
        field :pod_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
