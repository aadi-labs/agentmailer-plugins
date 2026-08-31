# frozen_string_literal: true

module AgentMailer
  module Inboxes
    module Types
      class ListInboxesRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :page_token, -> { String }, optional: true, nullable: false
      end
    end
  end
end
