# frozen_string_literal: true

module AgentMailer
  module Inboxes
    module Types
      class IssueCredentialsInboxesResponse < Internal::Types::Model
        field :username, -> { String }, optional: false, nullable: false

        field :password, -> { String }, optional: false, nullable: false

        field :imap, -> { AgentMailer::Types::MailProtocolEndpoint }, optional: false, nullable: false

        field :smtp, -> { AgentMailer::Types::MailProtocolEndpoint }, optional: false, nullable: false
      end
    end
  end
end
