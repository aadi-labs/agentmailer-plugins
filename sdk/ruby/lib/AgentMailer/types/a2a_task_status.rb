# frozen_string_literal: true

module AgentMailer
  module Types
    class A2ATaskStatus < Internal::Types::Model
      field :state, -> { AgentMailer::Types::A2ATaskStatusState }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :message, -> { AgentMailer::Types::A2ATaskStatusMessage }, optional: true, nullable: false
    end
  end
end
