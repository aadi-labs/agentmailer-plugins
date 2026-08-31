# frozen_string_literal: true

module AgentMailer
  module Attachments
    class Client
      # @param client [AgentMailer::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @param request_options [Hash]
      # @param params [AgentMailer::Attachments::Types::AttachmentUploadCreate]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :inbox_id
      #
      # @example
      #   client.attachments.upload(
      #     inbox_id: "inboxId",
      #     filename: "filename",
      #     content_type: "contentType",
      #     size: 1,
      #     checksum_sha256: "checksumSha256"
      #   )
      #
      # @return [Hash[String, Object]]
      def upload(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        request_data = AgentMailer::Attachments::Types::AttachmentUploadCreate.new(params).to_h
        non_body_param_names = %w[inboxId]
        body = request_data.except(*non_body_param_names)

        headers = { "Idempotency-Key" => AgentMailer::Internal::IdempotencyKey.generate }
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/inboxes/#{URI.encode_uri_component(params[:inbox_id].to_s)}/attachments",
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
        return if code.between?(200, 299)

        error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :inbox_id
      # @option params [String] :attachment_id
      #
      # @example
      #   client.attachments.complete(
      #     inbox_id: "inboxId",
      #     attachment_id: "attachmentId"
      #   )
      #
      # @return [AgentMailer::Attachments::Types::CompleteAttachmentsResponse]
      def complete(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/inboxes/#{URI.encode_uri_component(params[:inbox_id].to_s)}/attachments/#{URI.encode_uri_component(params[:attachment_id].to_s)}/complete",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::Attachments::Types::CompleteAttachmentsResponse.load(response.body)
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
      # @option params [String] :attachment_id
      #
      # @example
      #   client.attachments.download(
      #     inbox_id: "inboxId",
      #     attachment_id: "attachmentId"
      #   )
      #
      # @return [AgentMailer::Attachments::Types::DownloadAttachmentsResponse]
      def download(request_options: {}, **params)
        params = AgentMailer::Internal::Types::Utils.normalize_keys(params)
        request = AgentMailer::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/inboxes/#{URI.encode_uri_component(params[:inbox_id].to_s)}/attachments/#{URI.encode_uri_component(params[:attachment_id].to_s)}/download",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise AgentMailer::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          AgentMailer::Attachments::Types::DownloadAttachmentsResponse.load(response.body)
        else
          error_class = AgentMailer::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
