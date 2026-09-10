# frozen_string_literal: true

require_relative "wiremock_test_case"

class MessagesWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_messages_list_with_wiremock
    test_id = "messages.list.0"

    @client.messages.list(
      inbox_id: "inboxId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/inboxes/inboxId/messages",
      query_params: nil,
      expected: 1
    )
  end

  def test_messages_send__with_wiremock
    test_id = "messages.send_.0"

    @client.messages.send_(
      inbox_id: "inboxId",
      to: ["to"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.send_.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/inboxes/inboxId/messages/send",
      query_params: nil,
      expected: 1
    )
  end

  def test_messages_get_with_wiremock
    test_id = "messages.get.0"

    @client.messages.get(
      inbox_id: "inboxId",
      message_id: "messageId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/inboxes/inboxId/messages/messageId",
      query_params: nil,
      expected: 1
    )
  end

  def test_messages_delete_with_wiremock
    test_id = "messages.delete.0"

    @client.messages.delete(
      inbox_id: "inboxId",
      message_id: "messageId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v1/inboxes/inboxId/messages/messageId",
      query_params: nil,
      expected: 1
    )
  end

  def test_messages_reply_with_wiremock
    test_id = "messages.reply.0"

    @client.messages.reply(
      inbox_id: "inboxId",
      message_id: "messageId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.reply.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/inboxes/inboxId/messages/messageId/reply",
      query_params: nil,
      expected: 1
    )
  end

  def test_messages_reply_all_with_wiremock
    test_id = "messages.reply_all.0"

    @client.messages.reply_all(
      inbox_id: "inboxId",
      message_id: "messageId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.reply_all.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/inboxes/inboxId/messages/messageId/reply-all",
      query_params: nil,
      expected: 1
    )
  end

  def test_messages_forward_with_wiremock
    test_id = "messages.forward.0"

    @client.messages.forward(
      inbox_id: "inboxId",
      message_id: "messageId",
      to: ["to"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.forward.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/inboxes/inboxId/messages/messageId/forward",
      query_params: nil,
      expected: 1
    )
  end
end
