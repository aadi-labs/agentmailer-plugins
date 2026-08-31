# frozen_string_literal: true

module AgentMailer
  module Pods
    module Types
      class ListPodsResponse < Internal::Types::Model
        field :pods, -> { Internal::Types::Array[AgentMailer::Types::Pod] }, optional: false, nullable: false
      end
    end
  end
end
