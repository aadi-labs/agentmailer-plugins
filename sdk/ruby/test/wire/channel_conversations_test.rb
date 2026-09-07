# frozen_string_literal: true

require_relative "wiremock_test_case"

class ChannelConversationsWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_channel_conversations_list_with_wiremock
    test_id = "channel_conversations.list.0"

    @client.channel_conversations.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "channel_conversations.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/channel-conversations",
      query_params: nil,
      expected: 1
    )
  end

  def test_channel_conversations_get_with_wiremock
    test_id = "channel_conversations.get.0"

    @client.channel_conversations.get(
      conversation_id: "conversationId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "channel_conversations.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/channel-conversations/conversationId",
      query_params: nil,
      expected: 1
    )
  end

  def test_channel_conversations_update_with_wiremock
    test_id = "channel_conversations.update.0"

    @client.channel_conversations.update(
      conversation_id: "conversationId",
      status: "active",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "channel_conversations.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/v1/channel-conversations/conversationId",
      query_params: nil,
      expected: 1
    )
  end
end
