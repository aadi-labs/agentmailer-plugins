# frozen_string_literal: true

module AgentMailer
  module Attachments
    module Types
      class DownloadAttachmentsResponse < Internal::Types::Model
        field :url, -> { String }, optional: false, nullable: false

        field :expires_at, -> { String }, optional: false, nullable: false, api_name: "expiresAt"
      end
    end
  end
end
