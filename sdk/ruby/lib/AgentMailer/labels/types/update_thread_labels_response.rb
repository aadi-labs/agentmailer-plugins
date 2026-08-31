# frozen_string_literal: true

module AgentMailer
  module Labels
    module Types
      class UpdateThreadLabelsResponse < Internal::Types::Model
        field :labels, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
