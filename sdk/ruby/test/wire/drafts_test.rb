# frozen_string_literal: true

require_relative "wiremock_test_case"

class DraftsWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_drafts_list_with_wiremock
    test_id = "drafts.list.0"

    @client.drafts.list(
      inbox_id: "inboxId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "drafts.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/inboxes/inboxId/drafts",
      query_params: nil,
      expected: 1
    )
  end

  def test_drafts_create_with_wiremock
    test_id = "drafts.create.0"

    @client.drafts.create(
      inbox_id: "inboxId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "drafts.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/inboxes/inboxId/drafts",
      query_params: nil,
      expected: 1
    )
  end

  def test_drafts_get_with_wiremock
    test_id = "drafts.get.0"

    @client.drafts.get(
      inbox_id: "inboxId",
      draft_id: "draftId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "drafts.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/inboxes/inboxId/drafts/draftId",
      query_params: nil,
      expected: 1
    )
  end

  def test_drafts_delete_with_wiremock
    test_id = "drafts.delete.0"

    @client.drafts.delete(
      inbox_id: "inboxId",
      draft_id: "draftId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "drafts.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v1/inboxes/inboxId/drafts/draftId",
      query_params: nil,
      expected: 1
    )
  end

  def test_drafts_update_with_wiremock
    test_id = "drafts.update.0"

    @client.drafts.update(
      inbox_id: "inboxId",
      draft_id: "draftId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "drafts.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/v1/inboxes/inboxId/drafts/draftId",
      query_params: nil,
      expected: 1
    )
  end

  def test_drafts_send__with_wiremock
    test_id = "drafts.send_.0"

    @client.drafts.send_(
      inbox_id: "inboxId",
      draft_id: "draftId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "drafts.send_.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/inboxes/inboxId/drafts/draftId/send",
      query_params: nil,
      expected: 1
    )
  end
end
