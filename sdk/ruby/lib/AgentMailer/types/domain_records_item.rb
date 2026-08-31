# frozen_string_literal: true

module AgentMailer
  module Types
    class DomainRecordsItem < Internal::Types::Model
      field :type, -> { AgentMailer::Types::DomainRecordsItemType }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :value, -> { String }, optional: false, nullable: false

      field :priority, -> { Integer }, optional: true, nullable: false
    end
  end
end
