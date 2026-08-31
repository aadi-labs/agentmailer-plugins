# frozen_string_literal: true

module AgentMailer
  module Types
    class BootstrapResponseInbox < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :address, -> { String }, optional: false, nullable: false

      field :status, -> { AgentMailer::Types::BootstrapResponseInboxStatus }, optional: false, nullable: false
    end
  end
end
