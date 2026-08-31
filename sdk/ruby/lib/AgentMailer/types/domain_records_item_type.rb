# frozen_string_literal: true

module AgentMailer
  module Types
    module DomainRecordsItemType
      extend AgentMailer::Internal::Types::Enum

      CNAME = "CNAME"
      MX = "MX"
      TXT = "TXT"
    end
  end
end
