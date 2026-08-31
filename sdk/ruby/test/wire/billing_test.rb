# frozen_string_literal: true

require_relative "wiremock_test_case"

class BillingWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_billing_get_with_wiremock
    test_id = "billing.get.0"

    @client.billing.get(request_options: {
      additional_headers: {
        "X-Test-Id" => "billing.get.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/billing",
      query_params: nil,
      expected: 1
    )
  end

  def test_billing_create_checkout_with_wiremock
    test_id = "billing.create_checkout.0"

    @client.billing.create_checkout(request_options: {
      additional_headers: {
        "X-Test-Id" => "billing.create_checkout.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/billing/checkout",
      query_params: nil,
      expected: 1
    )
  end

  def test_billing_create_portal_with_wiremock
    test_id = "billing.create_portal.0"

    @client.billing.create_portal(request_options: {
      additional_headers: {
        "X-Test-Id" => "billing.create_portal.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/billing/portal",
      query_params: nil,
      expected: 1
    )
  end
end
