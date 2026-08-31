# frozen_string_literal: true

module AgentMailer
  module Types
    class BootstrapResponseLinks < Internal::Types::Model
      field :inbox, -> { String }, optional: false, nullable: false

      field :messages, -> { String }, optional: false, nullable: false

      field :events, -> { String }, optional: false, nullable: false

      field :imap, -> { String }, optional: false, nullable: false

      field :smtp, -> { String }, optional: false, nullable: false

      field :a2a, -> { String }, optional: false, nullable: false

      field :agent_card, -> { String }, optional: false, nullable: false, api_name: "agentCard"
    end
  end
end
