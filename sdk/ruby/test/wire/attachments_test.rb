# frozen_string_literal: true

require_relative "wiremock_test_case"

class AttachmentsWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_attachments_upload_with_wiremock
    test_id = "attachments.upload.0"

    @client.attachments.upload(
      inbox_id: "inboxId",
      filename: "filename",
      content_type: "contentType",
      size: 1,
      checksum_sha256: "checksumSha256",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "attachments.upload.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/inboxes/inboxId/attachments",
      query_params: nil,
      expected: 1
    )
  end

  def test_attachments_complete_with_wiremock
    test_id = "attachments.complete.0"

    @client.attachments.complete(
      inbox_id: "inboxId",
      attachment_id: "attachmentId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "attachments.complete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/inboxes/inboxId/attachments/attachmentId/complete",
      query_params: nil,
      expected: 1
    )
  end

  def test_attachments_download_with_wiremock
    test_id = "attachments.download.0"

    @client.attachments.download(
      inbox_id: "inboxId",
      attachment_id: "attachmentId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "attachments.download.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/inboxes/inboxId/attachments/attachmentId/download",
      query_params: nil,
      expected: 1
    )
  end
end
