# frozen_string_literal: true

require_relative "wiremock_test_case"

class AgentWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_agent_bootstrap_with_wiremock
    test_id = "agent.bootstrap.0"

    @client.agent.bootstrap(request_options: {
      additional_headers: {
        "X-Test-Id" => "agent.bootstrap.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/agent/bootstrap",
      query_params: nil,
      expected: 1
    )
  end

  def test_agent_sign_up_with_wiremock
    test_id = "agent.sign_up.0"

    @client.agent.sign_up(
      human_email: "human_email",
      username: "username",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "agent.sign_up.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/agent/sign-up",
      query_params: nil,
      expected: 1
    )
  end
end
