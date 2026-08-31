# frozen_string_literal: true

module AgentMailer
  module Domains
    module Types
      class ListDomainsResponse < Internal::Types::Model
        field :domains, -> { Internal::Types::Array[AgentMailer::Types::Domain] }, optional: false, nullable: false
      end
    end
  end
end
