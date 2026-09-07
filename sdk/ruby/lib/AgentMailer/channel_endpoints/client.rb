# frozen_string_literal: true

module AgentMailer
  module ChannelEndpoints
    class Client
      # @param client [AgentMailer::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # List human-channel endpoints
      #
      # @param request_options [Hash]
      # @param _params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.channel_endpoints.list
      #
      # @return [AgentMailer::ChannelEndpoints::Types::ListChannelEndpointsResponse]
      def list(request_options: {}, **_params)
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/channel-endpoints",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::ChannelEndpoints::Types::ListChannelEndpointsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Assign a human-channel endpoint
      #
      # @param request_options [Hash]
      # @param params [AgentMailer::ChannelEndpoints::Types::ChannelEndpointCreate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.channel_endpoints.create(
      #     inbox_id: "inboxId",
      #     pod_id: "podId",
      #     channel: "sms"
      #   )
      #
      # @return [AgentMailer::ChannelEndpoints::Types::CreateChannelEndpointsResponse]
      def create(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        headers = { "Idempotency-Key" => AgentMailer::Internal::IdempotencyKey.generate }
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/channel-endpoints",
          headers: headers,
          body: AgentMailer::ChannelEndpoints::Types::ChannelEndpointCreate.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::ChannelEndpoints::Types::CreateChannelEndpointsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a human-channel endpoint
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :endpoint_id
      #
      # @example
      #   client.channel_endpoints.get(endpoint_id: "endpointId")
      #
      # @return [AgentMailer::ChannelEndpoints::Types::GetChannelEndpointsResponse]
      def get(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/channel-endpoints/#{URI.encode_uri_component(params[:endpoint_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::ChannelEndpoints::Types::GetChannelEndpointsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Enable or disable a human-channel endpoint
      #
      # @param request_options [Hash]
      # @param params [AgentMailer::ChannelEndpoints::Types::ChannelEndpointUpdate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :endpoint_id
      #
      # @example
      #   client.channel_endpoints.update(
      #     endpoint_id: "endpointId",
      #     status: "active"
      #   )
      #
      # @return [AgentMailer::ChannelEndpoints::Types::UpdateChannelEndpointsResponse]
      def update(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        request_data = AgentMailer::ChannelEndpoints::Types::ChannelEndpointUpdate.new(params).to_h
        non_body_param_names = %w[endpointId]
        body = request_data.except(*non_body_param_names)

        headers = { "Idempotency-Key" => AgentMailer::Internal::IdempotencyKey.generate }
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "v1/channel-endpoints/#{URI.encode_uri_component(params[:endpoint_id].to_s)}",
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
          AgentMailer::ChannelEndpoints::Types::UpdateChannelEndpointsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
