# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendRcsContentRichCard < Internal::Types::Model
      field :body, -> { String }, optional: false, nullable: false

      field :title, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :attachment_id, -> { String }, optional: true, nullable: false, api_name: "attachmentId"

      field :replies, -> { Internal::Types::Array[AgentMailer::Types::ChannelMessageSendRcsContentRichCardRepliesItem] }, optional: true, nullable: false
    end
  end
end
