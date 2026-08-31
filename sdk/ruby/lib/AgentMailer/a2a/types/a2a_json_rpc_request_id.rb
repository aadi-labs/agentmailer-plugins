# frozen_string_literal: true

module AgentMailer
  module A2A
    module Types
      class A2AJsonRpcRequestId < Internal::Types::Model
        extend AgentMailer::Internal::Types::Union

        member -> { String }

        member -> { Integer }
      end
    end
  end
end
