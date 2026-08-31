# frozen_string_literal: true

require_relative "wiremock_test_case"

class WebhooksWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_webhooks_list_with_wiremock
    test_id = "webhooks.list.0"

    @client.webhooks.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "webhooks.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/webhooks",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhooks_create_with_wiremock
    test_id = "webhooks.create.0"

    @client.webhooks.create(
      url: "url",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhooks.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/webhooks",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhooks_get_with_wiremock
    test_id = "webhooks.get.0"

    @client.webhooks.get(
      webhook_id: "webhookId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhooks.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/webhooks/webhookId",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhooks_delete_with_wiremock
    test_id = "webhooks.delete.0"

    @client.webhooks.delete(
      webhook_id: "webhookId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhooks.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v1/webhooks/webhookId",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhooks_update_with_wiremock
    test_id = "webhooks.update.0"

    @client.webhooks.update(
      webhook_id: "webhookId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhooks.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/v1/webhooks/webhookId",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhooks_rotate_secret_with_wiremock
    test_id = "webhooks.rotate_secret.0"

    @client.webhooks.rotate_secret(
      webhook_id: "webhookId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhooks.rotate_secret.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/webhooks/webhookId/rotate-secret",
      query_params: nil,
      expected: 1
    )
  end
end
