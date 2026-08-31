# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class DraftUpdateAttachmentsItemContent < Internal::Types::Model
        field :filename, -> { String }, optional: false, nullable: false

        field :content_type, -> { String }, optional: false, nullable: false, api_name: "contentType"

        field :content, -> { String }, optional: false, nullable: false

        field :content_id, -> { String }, optional: true, nullable: false, api_name: "contentId"

        field :disposition, -> { AgentMailer::Drafts::Types::DraftUpdateAttachmentsItemContentDisposition }, optional: true, nullable: false
      end
    end
  end
end
