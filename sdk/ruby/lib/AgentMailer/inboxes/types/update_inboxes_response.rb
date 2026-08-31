# frozen_string_literal: true

module AgentMailer
  module Inboxes
    module Types
      class UpdateInboxesResponse < Internal::Types::Model
        field :inbox, -> { AgentMailer::Types::Inbox }, optional: false, nullable: false
      end
    end
  end
end
