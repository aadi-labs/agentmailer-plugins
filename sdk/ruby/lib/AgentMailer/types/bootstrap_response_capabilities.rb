# frozen_string_literal: true

module AgentMailer
  module Types
    class BootstrapResponseCapabilities < Internal::Types::Model
      field :receive, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :send_, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "send"

      field :imap, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :smtp, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :custom_domains, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "customDomains"

      field :a2a, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
