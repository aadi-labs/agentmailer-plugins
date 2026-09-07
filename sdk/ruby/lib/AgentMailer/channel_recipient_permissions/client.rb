# frozen_string_literal: true

module AgentMailer
  module ChannelRecipientPermissions
    class Client
      # @param client [AgentMailer::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # List human-channel consent and opt-out state
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :page_token
      # @option params [String, nil] :endpoint_id
      # @option params [AgentMailer::ChannelRecipientPermissions::Types::ListChannelRecipientPermissionsRequestChannel, nil] :channel
      # @option params [AgentMailer::ChannelRecipientPermissions::Types::ListChannelRecipientPermissionsRequestStatus, nil] :status
      #
      # @example
      #   client.channel_recipient_permissions.list
      #
      # @return [AgentMailer::ChannelRecipientPermissions::Types::ListChannelRecipientPermissionsResponse]
      def list(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["pageToken"] = params[:page_token] if params.key?(:page_token)
        query_params["endpointId"] = params[:endpoint_id] if params.key?(:endpoint_id)
        query_params["channel"] = params[:channel] if params.key?(:channel)
        query_params["status"] = params[:status] if params.key?(:status)

        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/channel-recipient-permissions",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::ChannelRecipientPermissions::Types::ListChannelRecipientPermissionsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
