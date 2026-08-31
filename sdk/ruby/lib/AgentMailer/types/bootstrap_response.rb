# frozen_string_literal: true

module AgentMailer
  module Types
    class BootstrapResponse < Internal::Types::Model
      field :agent, -> { AgentMailer::Types::BootstrapResponseAgent }, optional: false, nullable: false

      field :identity, -> { AgentMailer::Types::BootstrapResponseIdentity }, optional: false, nullable: false

      field :organization, -> { AgentMailer::Types::BootstrapResponseOrganization }, optional: false, nullable: false

      field :pod, -> { AgentMailer::Types::BootstrapResponsePod }, optional: false, nullable: false

      field :inbox, -> { AgentMailer::Types::BootstrapResponseInbox }, optional: false, nullable: false

      field :capabilities, -> { AgentMailer::Types::BootstrapResponseCapabilities }, optional: false, nullable: false

      field :limits, -> { AgentMailer::Types::BootstrapResponseLimits }, optional: false, nullable: false

      field :links, -> { AgentMailer::Types::BootstrapResponseLinks }, optional: false, nullable: false
    end
  end
end
