# frozen_string_literal: true

module AgentMailer
  module Lists
    module Types
      class ListCreate < Internal::Types::Model
        field :pod_id, -> { String }, optional: false, nullable: false, api_name: "podId"

        field :name, -> { String }, optional: false, nullable: false

        field :kind, -> { AgentMailer::Lists::Types::ListCreateKind }, optional: false, nullable: false
      end
    end
  end
end
