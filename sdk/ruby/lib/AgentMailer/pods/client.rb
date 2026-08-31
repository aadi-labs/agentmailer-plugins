# frozen_string_literal: true

module AgentMailer
  module Pods
    class Client
      # @param client [AgentMailer::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @param request_options [Hash]
      # @param _params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.pods.list
      #
      # @return [AgentMailer::Pods::Types::ListPodsResponse]
      def list(request_options: {}, **_params)
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/pods",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::Pods::Types::ListPodsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [AgentMailer::Pods::Types::PodCreate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.pods.create(name: "name")
      #
      # @return [AgentMailer::Pods::Types::CreatePodsResponse]
      def create(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        headers = { "Idempotency-Key" => AgentMailer::Internal::IdempotencyKey.generate }
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/pods",
          headers: headers,
          body: AgentMailer::Pods::Types::PodCreate.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::Pods::Types::CreatePodsResponse.load(response.body)
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
      # @option params [String] :pod_id
      #
      # @example
      #   client.pods.get(pod_id: "podId")
      #
      # @return [AgentMailer::Pods::Types::GetPodsResponse]
      def get(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/pods/#{URI.encode_uri_component(params[:pod_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::Pods::Types::GetPodsResponse.load(response.body)
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
      # @option params [String] :pod_id
      #
      # @example
      #   client.pods.delete(pod_id: "podId")
      #
      # @return [untyped]
      def delete(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v1/pods/#{URI.encode_uri_component(params[:pod_id].to_s)}",
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
      # @param params [AgentMailer::Pods::Types::PodUpdate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :pod_id
      #
      # @example
      #   client.pods.update(
      #     pod_id: "podId",
      #     name: "name"
      #   )
      #
      # @return [AgentMailer::Pods::Types::UpdatePodsResponse]
      def update(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        request_data = AgentMailer::Pods::Types::PodUpdate.new(params).to_h
        non_body_param_names = %w[podId]
        body = request_data.except(*non_body_param_names)

        headers = { "Idempotency-Key" => AgentMailer::Internal::IdempotencyKey.generate }
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "v1/pods/#{URI.encode_uri_component(params[:pod_id].to_s)}",
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
          AgentMailer::Pods::Types::UpdatePodsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
