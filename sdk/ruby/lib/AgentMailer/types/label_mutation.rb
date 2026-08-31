# frozen_string_literal: true

module AgentMailer
  module Types
    class LabelMutation < Internal::Types::Model
      field :add, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :remove, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
