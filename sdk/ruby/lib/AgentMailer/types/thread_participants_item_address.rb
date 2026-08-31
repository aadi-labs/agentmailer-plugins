# frozen_string_literal: true

module AgentMailer
  module Types
    class ThreadParticipantsItemAddress < Internal::Types::Model
      field :address, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
