# frozen_string_literal: true

module AgentMailer
  module A2A
    module Types
      class UpdateTaskA2AResponse < Internal::Types::Model
        field :task, -> { AgentMailer::Types::A2ATask }, optional: false, nullable: false
      end
    end
  end
end
