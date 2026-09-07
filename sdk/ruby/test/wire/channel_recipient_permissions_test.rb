# frozen_string_literal: true

require_relative "wiremock_test_case"

class ChannelRecipientPermissionsWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_channel_recipient_permissions_list_with_wiremock
    test_id = "channel_recipient_permissions.list.0"

    @client.channel_recipient_permissions.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "channel_recipient_permissions.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/channel-recipient-permissions",
      query_params: nil,
      expected: 1
    )
  end
end
