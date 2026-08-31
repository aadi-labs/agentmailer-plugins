# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class SendDraftsResponse < Internal::Types::Model
        field :message, -> { AgentMailer::Types::Message }, optional: false, nullable: false
      end
    end
  end
end
