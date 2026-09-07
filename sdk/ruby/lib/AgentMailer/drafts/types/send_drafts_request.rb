# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class SendDraftsRequest < Internal::Types::Model
        field :inbox_id, -> { String }, optional: false, nullable: false, api_name: "inboxId"

        field :draft_id, -> { String }, optional: false, nullable: false, api_name: "draftId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
      end
    end
  end
end
