# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelRecipientPermissionStatus
      extend AgentMailer::Internal::Types::Enum

      CONSENTED = "consented"
      OPTED_OUT = "opted_out"
    end
  end
end
