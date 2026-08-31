# frozen_string_literal: true

module AgentMailer
  module Types
    class MessageAttachmentsItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :filename, -> { String }, optional: false, nullable: false

      field :content_type, -> { String }, optional: false, nullable: false, api_name: "contentType"

      field :size, -> { Integer }, optional: false, nullable: false

      field :content_id, -> { String }, optional: false, nullable: true, api_name: "contentId"

      field :disposition, -> { AgentMailer::Types::MessageAttachmentsItemDisposition }, optional: false, nullable: false
    end
  end
end
