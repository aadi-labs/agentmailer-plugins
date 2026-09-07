# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSafety < Internal::Types::Model
      field :action, -> { AgentMailer::Types::ChannelMessageSafetyAction }, optional: false, nullable: false

      field :risk, -> { AgentMailer::Types::ChannelMessageSafetyRisk }, optional: false, nullable: false

      field :score, -> { Integer }, optional: false, nullable: false

      field :signals, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :classifier, -> { AgentMailer::Types::ChannelMessageSafetyClassifier }, optional: false, nullable: false

      field :model_status, -> { AgentMailer::Types::ChannelMessageSafetyModelStatus }, optional: false, nullable: false, api_name: "modelStatus"
    end
  end
end
