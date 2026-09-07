# frozen_string_literal: true

require_relative "wiremock_test_case"

class ChannelEndpointsWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_channel_endpoints_list_with_wiremock
    test_id = "channel_endpoints.list.0"

    @client.channel_endpoints.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "channel_endpoints.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/channel-endpoints",
      query_params: nil,
      expected: 1
    )
  end

  def test_channel_endpoints_create_with_wiremock
    test_id = "channel_endpoints.create.0"

    @client.channel_endpoints.create(
      inbox_id: "inboxId",
      pod_id: "podId",
      channel: "sms",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "channel_endpoints.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/channel-endpoints",
      query_params: nil,
      expected: 1
    )
  end

  def test_channel_endpoints_get_with_wiremock
    test_id = "channel_endpoints.get.0"

    @client.channel_endpoints.get(
      endpoint_id: "endpointId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "channel_endpoints.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/channel-endpoints/endpointId",
      query_params: nil,
      expected: 1
    )
  end

  def test_channel_endpoints_update_with_wiremock
    test_id = "channel_endpoints.update.0"

    @client.channel_endpoints.update(
      endpoint_id: "endpointId",
      status: "active",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "channel_endpoints.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/v1/channel-endpoints/endpointId",
      query_params: nil,
      expected: 1
    )
  end
end
