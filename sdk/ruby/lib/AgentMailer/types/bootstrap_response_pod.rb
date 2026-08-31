# frozen_string_literal: true

module AgentMailer
  module Types
    class BootstrapResponsePod < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
