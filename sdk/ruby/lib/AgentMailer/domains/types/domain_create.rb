# frozen_string_literal: true

module AgentMailer
  module Domains
    module Types
      class DomainCreate < Internal::Types::Model
        field :domain, -> { String }, optional: false, nullable: false

        field :pod_id, -> { String }, optional: true, nullable: false, api_name: "podId"
      end
    end
  end
end
