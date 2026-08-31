# frozen_string_literal: true

require_relative "wiremock_test_case"

class A2aWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_a2a_send_task_with_wiremock
    test_id = "a2a.send_task.0"

    @client.a2a.send_task(
      handle: "handle",
      jsonrpc: "2.0",
      method_: "method",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "a2a.send_task.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/a2a/handle",
      query_params: nil,
      expected: 1
    )
  end

  def test_a2a_get_agent_card_with_wiremock
    test_id = "a2a.get_agent_card.0"

    @client.a2a.get_agent_card(
      handle: "handle",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "a2a.get_agent_card.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/a2a/handle/.well-known/agent-card.json",
      query_params: nil,
      expected: 1
    )
  end

  def test_a2a_update_task_with_wiremock
    test_id = "a2a.update_task.0"

    @client.a2a.update_task(
      task_id: "taskId",
      state: "TASK_STATE_SUBMITTED",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "a2a.update_task.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/a2a/tasks/taskId",
      query_params: nil,
      expected: 1
    )
  end

  def test_a2a_update_identity_with_wiremock
    test_id = "a2a.update_identity.0"

    @client.a2a.update_identity(request_options: {
      additional_headers: {
        "X-Test-Id" => "a2a.update_identity.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/v1/a2a/identity",
      query_params: nil,
      expected: 1
    )
  end
end
