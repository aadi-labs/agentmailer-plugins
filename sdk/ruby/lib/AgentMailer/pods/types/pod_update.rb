# frozen_string_literal: true

module AgentMailer
  module Pods
    module Types
      class PodUpdate < Internal::Types::Model
        field :pod_id, -> { String }, optional: false, nullable: false, api_name: "podId"

        field :name, -> { String }, optional: false, nullable: false
      end
    end
  end
end
