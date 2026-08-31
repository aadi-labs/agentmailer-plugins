# frozen_string_literal: true

module AgentMailer
  module Pods
    module Types
      class UpdatePodsResponse < Internal::Types::Model
        field :pod, -> { AgentMailer::Types::Pod }, optional: false, nullable: false
      end
    end
  end
end
