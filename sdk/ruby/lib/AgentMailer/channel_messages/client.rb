# frozen_string_literal: true

module AgentMailer
  module ChannelMessages
    class Client
      # @param client [AgentMailer::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # List human-channel messages
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
      # @option params [String, nil] :conversation_id
      # @option params [AgentMailer::ChannelMessages::Types::ListChannelMessagesRequestChannel, nil] :channel
      #
      # @example
      #   client.channel_messages.list
      #
      # @return [AgentMailer::ChannelMessages::Types::ListChannelMessagesResponse]
      def list(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["pageToken"] = params[:page_token] if params.key?(:page_token)
        query_params["endpointId"] = params[:endpoint_id] if params.key?(:endpoint_id)
        query_params["conversationId"] = params[:conversation_id] if params.key?(:conversation_id)
        query_params["channel"] = params[:channel] if params.key?(:channel)

        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/channel-messages",
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
          AgentMailer::ChannelMessages::Types::ListChannelMessagesResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Sends through an assigned SMS, MMS, RCS, WhatsApp, or outbound voice endpoint. Supports RCS rich cards and
      # replies, plus WhatsApp media and reply buttons. All non-template WhatsApp messages require a recipient message
      # within the last 24 hours; otherwise use an approved template.
      #
      # @param request_options [Hash]
      # @param params [AgentMailer::Types::ChannelMessageSend]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :idempotency_key
      #
      # @example
      #   client.channel_messages.send_(idempotency_key: "Idempotency-Key")
      #
      # @return [AgentMailer::ChannelMessages::Types::SendChannelMessagesResponse]
      def send_(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/channel-messages",
          headers: headers,
          body: AgentMailer::Types::ChannelMessageSend.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::ChannelMessages::Types::SendChannelMessagesResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
