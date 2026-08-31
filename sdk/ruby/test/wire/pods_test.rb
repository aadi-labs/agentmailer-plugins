# frozen_string_literal: true

require_relative "wiremock_test_case"

class PodsWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_pods_list_with_wiremock
    test_id = "pods.list.0"

    @client.pods.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "pods.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/pods",
      query_params: nil,
      expected: 1
    )
  end

  def test_pods_create_with_wiremock
    test_id = "pods.create.0"

    @client.pods.create(
      name: "name",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "pods.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/pods",
      query_params: nil,
      expected: 1
    )
  end

  def test_pods_get_with_wiremock
    test_id = "pods.get.0"

    @client.pods.get(
      pod_id: "podId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "pods.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/pods/podId",
      query_params: nil,
      expected: 1
    )
  end

  def test_pods_delete_with_wiremock
    test_id = "pods.delete.0"

    @client.pods.delete(
      pod_id: "podId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "pods.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v1/pods/podId",
      query_params: nil,
      expected: 1
    )
  end

  def test_pods_update_with_wiremock
    test_id = "pods.update.0"

    @client.pods.update(
      pod_id: "podId",
      name: "name",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "pods.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/v1/pods/podId",
      query_params: nil,
      expected: 1
    )
  end
end
