# frozen_string_literal: true

require_relative "wiremock_test_case"

class ChannelMessagesWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_channel_messages_list_with_wiremock
    test_id = "channel_messages.list.0"

    @client.channel_messages.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "channel_messages.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/channel-messages",
      query_params: nil,
      expected: 1
    )
  end

  def test_channel_messages_send__with_wiremock
    test_id = "channel_messages.send_.0"

    @client.channel_messages.send_(
      idempotency_key: "Idempotency-Key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "channel_messages.send_.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/channel-messages",
      query_params: nil,
      expected: 1
    )
  end
end
