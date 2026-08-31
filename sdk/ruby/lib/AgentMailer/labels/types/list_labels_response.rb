# frozen_string_literal: true

module AgentMailer
  module Labels
    module Types
      class ListLabelsResponse < Internal::Types::Model
        field :labels, -> { Internal::Types::Array[AgentMailer::Types::Label] }, optional: false, nullable: false
      end
    end
  end
end
