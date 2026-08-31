# frozen_string_literal: true

module AgentMailer
  module Threads
    module Types
      class ListThreadsRequest < Internal::Types::Model
        field :inbox_id, -> { String }, optional: false, nullable: false, api_name: "inboxId"

        field :limit, -> { Integer }, optional: true, nullable: false

        field :page_token, -> { String }, optional: true, nullable: false

        field :label, -> { String }, optional: true, nullable: false

        field :query, -> { String }, optional: true, nullable: false

        field :before, -> { String }, optional: true, nullable: false

        field :after, -> { String }, optional: true, nullable: false
      end
    end
  end
end
