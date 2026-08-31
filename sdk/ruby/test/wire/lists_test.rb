# frozen_string_literal: true

require_relative "wiremock_test_case"

class ListsWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_lists_list_with_wiremock
    test_id = "lists.list.0"

    @client.lists.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "lists.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/lists",
      query_params: nil,
      expected: 1
    )
  end

  def test_lists_create_with_wiremock
    test_id = "lists.create.0"

    @client.lists.create(
      pod_id: "podId",
      name: "name",
      kind: "allow",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "lists.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/lists",
      query_params: nil,
      expected: 1
    )
  end

  def test_lists_delete_with_wiremock
    test_id = "lists.delete.0"

    @client.lists.delete(
      list_id: "listId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "lists.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v1/lists/listId",
      query_params: nil,
      expected: 1
    )
  end

  def test_lists_add_entry_with_wiremock
    test_id = "lists.add_entry.0"

    @client.lists.add_entry(
      list_id: "listId",
      address_pattern: "addressPattern",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "lists.add_entry.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/lists/listId/entries",
      query_params: nil,
      expected: 1
    )
  end

  def test_lists_remove_entry_with_wiremock
    test_id = "lists.remove_entry.0"

    @client.lists.remove_entry(
      list_id: "listId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "lists.remove_entry.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v1/lists/listId/entries",
      query_params: nil,
      expected: 1
    )
  end
end
