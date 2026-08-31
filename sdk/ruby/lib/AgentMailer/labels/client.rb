# frozen_string_literal: true

module AgentMailer
  module Labels
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
      # @option params [String, nil] :pod_id
      #
      # @example
      #   client.labels.list
      #
      # @return [AgentMailer::Labels::Types::ListLabelsResponse]
      def list(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["pod_id"] = params[:pod_id] if params.key?(:pod_id)

        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/labels",
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
          AgentMailer::Labels::Types::ListLabelsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [AgentMailer::Labels::Types::LabelCreate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.labels.create(
      #     pod_id: "podId",
      #     name: "name"
      #   )
      #
      # @return [AgentMailer::Labels::Types::CreateLabelsResponse]
      def create(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        headers = { "Idempotency-Key" => AgentMailer::Internal::IdempotencyKey.generate }
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/labels",
          headers: headers,
          body: AgentMailer::Labels::Types::LabelCreate.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::Labels::Types::CreateLabelsResponse.load(response.body)
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
      # @option params [String] :label_id
      #
      # @example
      #   client.labels.delete(label_id: "labelId")
      #
      # @return [untyped]
      def delete(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v1/labels/#{URI.encode_uri_component(params[:label_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # @param request_options [Hash]
      # @param params [AgentMailer::Types::LabelMutation]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :message_id
      #
      # @example
      #   client.labels.update_message(message_id: "messageId")
      #
      # @return [AgentMailer::Labels::Types::UpdateMessageLabelsResponse]
      def update_message(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[message_id]
        body_params = params.except(*path_param_names)

        headers = { "Idempotency-Key" => AgentMailer::Internal::IdempotencyKey.generate }
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "v1/messages/#{URI.encode_uri_component(params[:message_id].to_s)}/labels",
          headers: headers,
          body: AgentMailer::Types::LabelMutation.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::Labels::Types::UpdateMessageLabelsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [AgentMailer::Types::LabelMutation]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :thread_id
      #
      # @example
      #   client.labels.update_thread(thread_id: "threadId")
      #
      # @return [AgentMailer::Labels::Types::UpdateThreadLabelsResponse]
      def update_thread(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[thread_id]
        body_params = params.except(*path_param_names)

        headers = { "Idempotency-Key" => AgentMailer::Internal::IdempotencyKey.generate }
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "v1/threads/#{URI.encode_uri_component(params[:thread_id].to_s)}/labels",
          headers: headers,
          body: AgentMailer::Types::LabelMutation.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::Labels::Types::UpdateThreadLabelsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
