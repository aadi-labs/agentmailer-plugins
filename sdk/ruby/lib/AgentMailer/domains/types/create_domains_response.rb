# frozen_string_literal: true

module AgentMailer
  module Domains
    module Types
      class CreateDomainsResponse < Internal::Types::Model
        field :domain, -> { AgentMailer::Types::Domain }, optional: false, nullable: false
      end
    end
  end
end
