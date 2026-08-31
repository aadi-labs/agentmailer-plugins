# frozen_string_literal: true

module AgentMailer
  module Types
    class DraftAttachmentsItemContent < Internal::Types::Model
      field :filename, -> { String }, optional: false, nullable: false

      field :content_type, -> { Object }, optional: false, nullable: false, api_name: "contentType"

      field :content, -> { String }, optional: false, nullable: false

      field :content_id, -> { String }, optional: true, nullable: false, api_name: "contentId"

      field :disposition, -> { AgentMailer::Types::DraftAttachmentsItemContentDisposition }, optional: false, nullable: false
    end
  end
end
