# frozen_string_literal: true

module AgentMailer
  class Client
    # @param base_url [String, nil]
    # @param token [String]
    # @param max_retries [Integer]
    #
    # @return [void]
    def initialize(base_url: nil, token: ENV.fetch("AGENTMAILER_API_KEY", nil), max_retries: 2)
      @raw_client = AgentMailer::Internal::Http::RawClient.new(
        base_url: base_url || AgentMailer::Environment::DEFAULT,
        headers: {
          "X-Fern-Language" => "Ruby",
          Authorization: "Bearer #{token}"
        },
        max_retries: max_retries
      )
    end

    # @return [AgentMailer::Agent::Client]
    def agent
      @agent ||= AgentMailer::Agent::Client.new(client: @raw_client)
    end

    # @return [AgentMailer::Inboxes::Client]
    def inboxes
      @inboxes ||= AgentMailer::Inboxes::Client.new(client: @raw_client)
    end

    # @return [AgentMailer::Messages::Client]
    def messages
      @messages ||= AgentMailer::Messages::Client.new(client: @raw_client)
    end

    # @return [AgentMailer::Threads::Client]
    def threads
      @threads ||= AgentMailer::Threads::Client.new(client: @raw_client)
    end

    # @return [AgentMailer::Drafts::Client]
    def drafts
      @drafts ||= AgentMailer::Drafts::Client.new(client: @raw_client)
    end

    # @return [AgentMailer::Attachments::Client]
    def attachments
      @attachments ||= AgentMailer::Attachments::Client.new(client: @raw_client)
    end

    # @return [AgentMailer::Pods::Client]
    def pods
      @pods ||= AgentMailer::Pods::Client.new(client: @raw_client)
    end

    # @return [AgentMailer::Domains::Client]
    def domains
      @domains ||= AgentMailer::Domains::Client.new(client: @raw_client)
    end

    # @return [AgentMailer::Webhooks::Client]
    def webhooks
      @webhooks ||= AgentMailer::Webhooks::Client.new(client: @raw_client)
    end

    # @return [AgentMailer::Labels::Client]
    def labels
      @labels ||= AgentMailer::Labels::Client.new(client: @raw_client)
    end

    # @return [AgentMailer::Lists::Client]
    def lists
      @lists ||= AgentMailer::Lists::Client.new(client: @raw_client)
    end

    # @return [AgentMailer::Events::Client]
    def events
      @events ||= AgentMailer::Events::Client.new(client: @raw_client)
    end

    # @return [AgentMailer::Billing::Client]
    def billing
      @billing ||= AgentMailer::Billing::Client.new(client: @raw_client)
    end

    # @return [AgentMailer::A2A::Client]
    def a2a
      @a2a ||= AgentMailer::A2A::Client.new(client: @raw_client)
    end
  end
end
