# frozen_string_literal: true

module AgentMailer
  module Attachments
    module Types
      class AttachmentUploadCreate < Internal::Types::Model
        field :inbox_id, -> { String }, optional: false, nullable: false, api_name: "inboxId"

        field :filename, -> { String }, optional: false, nullable: false

        field :content_type, -> { String }, optional: false, nullable: false, api_name: "contentType"

        field :size, -> { Integer }, optional: false, nullable: false

        field :checksum_sha256, -> { String }, optional: false, nullable: false, api_name: "checksumSha256"
      end
    end
  end
end
