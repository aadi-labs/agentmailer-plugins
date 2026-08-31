# frozen_string_literal: true

require_relative "wiremock_test_case"

class EventsWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_events_create_ticket_with_wiremock
    test_id = "events.create_ticket.0"

    @client.events.create_ticket(
      pod_id: "podId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "events.create_ticket.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/events/tickets",
      query_params: nil,
      expected: 1
    )
  end
end
