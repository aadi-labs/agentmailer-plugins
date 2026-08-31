# frozen_string_literal: true

module AgentMailer
  module Inboxes
    module Types
      class GetInboxesResponse < Internal::Types::Model
        field :inbox, -> { AgentMailer::Types::Inbox }, optional: false, nullable: false
      end
    end
  end
end
