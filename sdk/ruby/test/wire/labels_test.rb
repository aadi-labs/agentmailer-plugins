# frozen_string_literal: true

require_relative "wiremock_test_case"

class LabelsWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_labels_list_with_wiremock
    test_id = "labels.list.0"

    @client.labels.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "labels.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/labels",
      query_params: nil,
      expected: 1
    )
  end

  def test_labels_create_with_wiremock
    test_id = "labels.create.0"

    @client.labels.create(
      pod_id: "podId",
      name: "name",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labels.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/labels",
      query_params: nil,
      expected: 1
    )
  end

  def test_labels_delete_with_wiremock
    test_id = "labels.delete.0"

    @client.labels.delete(
      label_id: "labelId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labels.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v1/labels/labelId",
      query_params: nil,
      expected: 1
    )
  end

  def test_labels_update_message_with_wiremock
    test_id = "labels.update_message.0"

    @client.labels.update_message(
      message_id: "messageId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labels.update_message.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/v1/messages/messageId/labels",
      query_params: nil,
      expected: 1
    )
  end

  def test_labels_update_thread_with_wiremock
    test_id = "labels.update_thread.0"

    @client.labels.update_thread(
      thread_id: "threadId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labels.update_thread.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/v1/threads/threadId/labels",
      query_params: nil,
      expected: 1
    )
  end
end
