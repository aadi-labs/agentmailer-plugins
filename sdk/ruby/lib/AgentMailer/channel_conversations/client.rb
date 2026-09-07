# frozen_string_literal: true

module AgentMailer
  module ChannelConversations
    class Client
      # @param client [AgentMailer::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # List human-channel conversations
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
      # @option params [AgentMailer::ChannelConversations::Types::ListChannelConversationsRequestChannel, nil] :channel
      # @option params [AgentMailer::ChannelConversations::Types::ListChannelConversationsRequestStatus, nil] :status
      #
      # @example
      #   client.channel_conversations.list
      #
      # @return [AgentMailer::ChannelConversations::Types::ListChannelConversationsResponse]
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
          path: "v1/channel-conversations",
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
          AgentMailer::ChannelConversations::Types::ListChannelConversationsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a human-channel conversation
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :conversation_id
      #
      # @example
      #   client.channel_conversations.get(conversation_id: "conversationId")
      #
      # @return [AgentMailer::ChannelConversations::Types::GetChannelConversationsResponse]
      def get(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/channel-conversations/#{URI.encode_uri_component(params[:conversation_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::ChannelConversations::Types::GetChannelConversationsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Open or close a human-channel conversation
      #
      # @param request_options [Hash]
      # @param params [AgentMailer::ChannelConversations::Types::ChannelConversationUpdate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :conversation_id
      #
      # @example
      #   client.channel_conversations.update(
      #     conversation_id: "conversationId",
      #     status: "active"
      #   )
      #
      # @return [AgentMailer::ChannelConversations::Types::UpdateChannelConversationsResponse]
      def update(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        request_data = AgentMailer::ChannelConversations::Types::ChannelConversationUpdate.new(params).to_h
        non_body_param_names = %w[conversationId]
        body = request_data.except(*non_body_param_names)

        headers = { "Idempotency-Key" => AgentMailer::Internal::IdempotencyKey.generate }
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "v1/channel-conversations/#{URI.encode_uri_component(params[:conversation_id].to_s)}",
          headers: headers,
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::ChannelConversations::Types::UpdateChannelConversationsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
