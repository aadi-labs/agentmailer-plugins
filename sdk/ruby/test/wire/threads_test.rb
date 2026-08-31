# frozen_string_literal: true

require_relative "wiremock_test_case"

class ThreadsWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_threads_list_with_wiremock
    test_id = "threads.list.0"

    @client.threads.list(
      inbox_id: "inboxId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "threads.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/inboxes/inboxId/threads",
      query_params: nil,
      expected: 1
    )
  end

  def test_threads_get_with_wiremock
    test_id = "threads.get.0"

    @client.threads.get(
      inbox_id: "inboxId",
      thread_id: "threadId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "threads.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/inboxes/inboxId/threads/threadId",
      query_params: nil,
      expected: 1
    )
  end
end
