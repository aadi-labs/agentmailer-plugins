# frozen_string_literal: true

module AgentMailer
  module Labels
    module Types
      class LabelCreate < Internal::Types::Model
        field :pod_id, -> { String }, optional: false, nullable: false, api_name: "podId"

        field :name, -> { String }, optional: false, nullable: false

        field :color, -> { String }, optional: true, nullable: false
      end
    end
  end
end
