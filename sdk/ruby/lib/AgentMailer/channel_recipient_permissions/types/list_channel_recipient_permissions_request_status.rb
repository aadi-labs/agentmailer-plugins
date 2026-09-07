# frozen_string_literal: true

module AgentMailer
  module ChannelRecipientPermissions
    module Types
      module ListChannelRecipientPermissionsRequestStatus
        extend AgentMailer::Internal::Types::Enum

        CONSENTED = "consented"
        OPTED_OUT = "opted_out"
      end
    end
  end
end
