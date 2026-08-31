# frozen_string_literal: true

module AgentMailer
  module Labels
    module Types
      class ListLabelsRequest < Internal::Types::Model
        field :pod_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
