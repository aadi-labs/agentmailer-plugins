# frozen_string_literal: true

module AgentMailer
  module Pods
    module Types
      class PodCreate < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false
      end
    end
  end
end
