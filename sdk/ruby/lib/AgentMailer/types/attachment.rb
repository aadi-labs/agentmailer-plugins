# frozen_string_literal: true

module AgentMailer
  module Types
    class Attachment < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :filename, -> { String }, optional: false, nullable: false

      field :content_type, -> { String }, optional: false, nullable: false, api_name: "contentType"

      field :size, -> { Integer }, optional: false, nullable: false

      field :status, -> { AgentMailer::Types::AttachmentStatus }, optional: false, nullable: false

      field :expires_at, -> { String }, optional: false, nullable: true, api_name: "expiresAt"
    end
  end
end
