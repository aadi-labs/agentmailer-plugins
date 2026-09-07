# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendRcsContentRichCardRepliesItem < Internal::Types::Model
      field :text, -> { String }, optional: false, nullable: false

      field :data, -> { String }, optional: false, nullable: false
    end
  end
end
