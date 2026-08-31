# frozen_string_literal: true

module AgentMailer
  module Agent
    module Types
      class SignUpAgentResponse < Internal::Types::Model
        field :status, -> { AgentMailer::Agent::Types::SignUpAgentResponseStatus }, optional: false, nullable: false

        field :username, -> { String }, optional: false, nullable: false

        field :requested_email_address, -> { String }, optional: false, nullable: false, api_name: "requestedEmailAddress"

        field :approval_url, -> { String }, optional: false, nullable: false, api_name: "approvalUrl"
      end
    end
  end
end
