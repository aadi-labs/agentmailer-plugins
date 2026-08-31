# frozen_string_literal: true

module AgentMailer
  module Labels
    module Types
      class CreateLabelsResponse < Internal::Types::Model
        field :label, -> { AgentMailer::Types::Label }, optional: false, nullable: false
      end
    end
  end
end
