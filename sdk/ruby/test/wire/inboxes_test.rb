# frozen_string_literal: true

require_relative "wiremock_test_case"

class InboxesWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_inboxes_list_with_wiremock
    test_id = "inboxes.list.0"

    @client.inboxes.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "inboxes.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/inboxes",
      query_params: nil,
      expected: 1
    )
  end

  def test_inboxes_create_with_wiremock
    test_id = "inboxes.create.0"

    @client.inboxes.create(request_options: {
      additional_headers: {
        "X-Test-Id" => "inboxes.create.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/inboxes",
      query_params: nil,
      expected: 1
    )
  end

  def test_inboxes_get_with_wiremock
    test_id = "inboxes.get.0"

    @client.inboxes.get(
      inbox_id: "inboxId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inboxes.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/inboxes/inboxId",
      query_params: nil,
      expected: 1
    )
  end

  def test_inboxes_delete_with_wiremock
    test_id = "inboxes.delete.0"

    @client.inboxes.delete(
      inbox_id: "inboxId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inboxes.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v1/inboxes/inboxId",
      query_params: nil,
      expected: 1
    )
  end

  def test_inboxes_update_with_wiremock
    test_id = "inboxes.update.0"

    @client.inboxes.update(
      inbox_id: "inboxId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inboxes.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/v1/inboxes/inboxId",
      query_params: nil,
      expected: 1
    )
  end

  def test_inboxes_issue_credentials_with_wiremock
    test_id = "inboxes.issue_credentials.0"

    @client.inboxes.issue_credentials(
      inbox_id: "inboxId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "inboxes.issue_credentials.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/inboxes/inboxId/credentials",
      query_params: nil,
      expected: 1
    )
  end
end
