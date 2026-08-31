# frozen_string_literal: true

module AgentMailer
  module Types
    class A2AAgentCardSkillsItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :tags, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :examples, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :input_modes, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "inputModes"

      field :output_modes, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "outputModes"
    end
  end
end
