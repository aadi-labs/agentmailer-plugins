# frozen_string_literal: true

module AgentMailer
  module Types
    class BootstrapResponseIdentity < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :handle, -> { String }, optional: false, nullable: false

      field :email_address, -> { String }, optional: false, nullable: false, api_name: "emailAddress"
    end
  end
end
