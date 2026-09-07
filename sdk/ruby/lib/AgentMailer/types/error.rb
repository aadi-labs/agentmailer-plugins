# frozen_string_literal: true

module AgentMailer
  module Types
    class Error < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :title, -> { String }, optional: false, nullable: false

      field :status, -> { Integer }, optional: false, nullable: false

      field :code, -> { String }, optional: false, nullable: false

      field :detail, -> { String }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false, api_name: "requestId"
    end
  end
end
