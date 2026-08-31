# frozen_string_literal: true

module AgentMailer
  module Types
    class BootstrapResponseOrganization < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
