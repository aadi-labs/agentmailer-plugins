# frozen_string_literal: true

module AgentMailer
  module Agent
    module Types
      class BootstrapRequest < Internal::Types::Model
        field :requested_local_part, -> { String }, optional: true, nullable: false, api_name: "requestedLocalPart"

        field :pod_name, -> { String }, optional: true, nullable: false, api_name: "podName"
      end
    end
  end
end
