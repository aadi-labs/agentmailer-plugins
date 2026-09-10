# frozen_string_literal: true

module AgentMailer
  module Threads
    class Client
      # @param client [AgentMailer::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :inbox_id
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :page_token
      # @option params [String, nil] :label
      # @option params [String, nil] :query
      # @option params [String, nil] :before
      # @option params [String, nil] :after
      #
      # @example
      #   client.threads.list(inbox_id: "inboxId")
      #
      # @return [AgentMailer::Threads::Types::ListThreadsResponse]
      def list(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["page_token"] = params[:page_token] if params.key?(:page_token)
        query_params["label"] = params[:label] if params.key?(:label)
        query_params["query"] = params[:query] if params.key?(:query)
        query_params["before"] = params[:before] if params.key?(:before)
        query_params["after"] = params[:after] if params.key?(:after)

        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/inboxes/#{URI.encode_uri_component(params[:inbox_id].to_s)}/threads",
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
          AgentMailer::Threads::Types::ListThreadsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :inbox_id
      # @option params [String] :thread_id
      #
      # @example
      #   client.threads.get(
      #     inbox_id: "inboxId",
      #     thread_id: "threadId"
      #   )
      #
      # @return [AgentMailer::Threads::Types::GetThreadsResponse]
      def get(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/inboxes/#{URI.encode_uri_component(params[:inbox_id].to_s)}/threads/#{URI.encode_uri_component(params[:thread_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::Threads::Types::GetThreadsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
