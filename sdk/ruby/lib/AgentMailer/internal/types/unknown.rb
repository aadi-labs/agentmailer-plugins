# frozen_string_literal: true

module AgentMailer
  module Internal
    module Types
      module Unknown
        include AgentMailer::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end
