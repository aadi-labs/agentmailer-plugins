# frozen_string_literal: true

require_relative "wiremock_test_case"

class DomainsWireTest < WireMockTestCase
  def setup
    super

    @client = AgentMailer::Client.new(
      api_key: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_domains_list_with_wiremock
    test_id = "domains.list.0"

    @client.domains.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "domains.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/domains",
      query_params: nil,
      expected: 1
    )
  end

  def test_domains_create_with_wiremock
    test_id = "domains.create.0"

    @client.domains.create(
      domain: "domain",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "domains.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/domains",
      query_params: nil,
      expected: 1
    )
  end

  def test_domains_get_with_wiremock
    test_id = "domains.get.0"

    @client.domains.get(
      domain_id: "domainId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "domains.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/domains/domainId",
      query_params: nil,
      expected: 1
    )
  end

  def test_domains_delete_with_wiremock
    test_id = "domains.delete.0"

    @client.domains.delete(
      domain_id: "domainId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "domains.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v1/domains/domainId",
      query_params: nil,
      expected: 1
    )
  end

  def test_domains_verify_with_wiremock
    test_id = "domains.verify.0"

    @client.domains.verify(
      domain_id: "domainId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "domains.verify.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v1/domains/domainId/verify",
      query_params: nil,
      expected: 1
    )
  end
end
