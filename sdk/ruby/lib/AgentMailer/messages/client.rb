# frozen_string_literal: true

module AgentMailer
  module Messages
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
      # @option params [String, nil] :thread_id
      # @option params [String, nil] :label
      # @option params [String, nil] :query
      # @option params [String, nil] :before
      # @option params [String, nil] :after
      #
      # @example
      #   client.messages.list(inbox_id: "inboxId")
      #
      # @return [AgentMailer::Messages::Types::ListMessagesResponse]
      def list(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["page_token"] = params[:page_token] if params.key?(:page_token)
        query_params["thread_id"] = params[:thread_id] if params.key?(:thread_id)
        query_params["label"] = params[:label] if params.key?(:label)
        query_params["query"] = params[:query] if params.key?(:query)
        query_params["before"] = params[:before] if params.key?(:before)
        query_params["after"] = params[:after] if params.key?(:after)

        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/inboxes/#{URI.encode_uri_component(params[:inbox_id].to_s)}/messages",
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
          AgentMailer::Messages::Types::ListMessagesResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [AgentMailer::Types::MessageCompose]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :inbox_id
      #
      # @example
      #   client.messages.send_(
      #     inbox_id: "inboxId",
      #     to: ["to"]
      #   )
      #
      # @return [AgentMailer::Messages::Types::SendMessagesResponse]
      def send_(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[inbox_id]
        body_params = params.except(*path_param_names)

        headers = { "Idempotency-Key" => AgentMailer::Internal::IdempotencyKey.generate }
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/inboxes/#{URI.encode_uri_component(params[:inbox_id].to_s)}/messages/send",
          headers: headers,
          body: AgentMailer::Types::MessageCompose.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::Messages::Types::SendMessagesResponse.load(response.body)
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
      # @option params [String] :message_id
      #
      # @example
      #   client.messages.get(
      #     inbox_id: "inboxId",
      #     message_id: "messageId"
      #   )
      #
      # @return [AgentMailer::Messages::Types::GetMessagesResponse]
      def get(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/inboxes/#{URI.encode_uri_component(params[:inbox_id].to_s)}/messages/#{URI.encode_uri_component(params[:message_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::Messages::Types::GetMessagesResponse.load(response.body)
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
      # @option params [String] :message_id
      #
      # @example
      #   client.messages.delete(
      #     inbox_id: "inboxId",
      #     message_id: "messageId"
      #   )
      #
      # @return [untyped]
      def delete(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v1/inboxes/#{URI.encode_uri_component(params[:inbox_id].to_s)}/messages/#{URI.encode_uri_component(params[:message_id].to_s)}",
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
      # @param params [AgentMailer::Types::ReplyCompose]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :inbox_id
      # @option params [String] :message_id
      #
      # @example
      #   client.messages.reply(
      #     inbox_id: "inboxId",
      #     message_id: "messageId"
      #   )
      #
      # @return [AgentMailer::Messages::Types::ReplyMessagesResponse]
      def reply(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[inbox_id message_id]
        body_params = params.except(*path_param_names)

        headers = { "Idempotency-Key" => AgentMailer::Internal::IdempotencyKey.generate }
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/inboxes/#{URI.encode_uri_component(params[:inbox_id].to_s)}/messages/#{URI.encode_uri_component(params[:message_id].to_s)}/reply",
          headers: headers,
          body: AgentMailer::Types::ReplyCompose.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::Messages::Types::ReplyMessagesResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [AgentMailer::Types::ReplyCompose]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :inbox_id
      # @option params [String] :message_id
      #
      # @example
      #   client.messages.reply_all(
      #     inbox_id: "inboxId",
      #     message_id: "messageId"
      #   )
      #
      # @return [AgentMailer::Messages::Types::ReplyAllMessagesResponse]
      def reply_all(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[inbox_id message_id]
        body_params = params.except(*path_param_names)

        headers = { "Idempotency-Key" => AgentMailer::Internal::IdempotencyKey.generate }
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/inboxes/#{URI.encode_uri_component(params[:inbox_id].to_s)}/messages/#{URI.encode_uri_component(params[:message_id].to_s)}/reply-all",
          headers: headers,
          body: AgentMailer::Types::ReplyCompose.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::Messages::Types::ReplyAllMessagesResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [AgentMailer::Types::MessageCompose]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :inbox_id
      # @option params [String] :message_id
      #
      # @example
      #   client.messages.forward(
      #     inbox_id: "inboxId",
      #     message_id: "messageId",
      #     to: ["to"]
      #   )
      #
      # @return [AgentMailer::Messages::Types::ForwardMessagesResponse]
      def forward(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[inbox_id message_id]
        body_params = params.except(*path_param_names)

        headers = { "Idempotency-Key" => AgentMailer::Internal::IdempotencyKey.generate }
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/inboxes/#{URI.encode_uri_component(params[:inbox_id].to_s)}/messages/#{URI.encode_uri_component(params[:message_id].to_s)}/forward",
          headers: headers,
          body: AgentMailer::Types::MessageCompose.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::Messages::Types::ForwardMessagesResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
