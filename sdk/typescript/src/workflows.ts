import type { AgentMailerClient } from "./Client.js";
import type { A2AAgentCard } from "./api/types/A2AAgentCard.js";
import type { Inbox } from "./api/types/Inbox.js";
import type { Message } from "./api/types/Message.js";

export interface EnsureInboxRequest {
    username: string;
    podId?: string;
    domainId?: string;
    clientId?: string;
    displayName?: string;
}

export interface SendTextRequest {
    inboxId: string;
    to: string | string[];
    subject: string;
    text: string;
}

/**
 * Opinionated, composable workflows over the generated endpoint clients.
 * The methods remain idempotent or read-first so agents can safely retry them.
 */
export class AgentMailerWorkflows {
    public constructor(private readonly client: AgentMailerClient) {}

    public async listAllInboxes(): Promise<Inbox[]> {
        const inboxes: Inbox[] = [];
        let pageToken: string | undefined;
        do {
            const page = await this.client.inboxes.list({ limit: 100, page_token: pageToken });
            inboxes.push(...page.inboxes);
            pageToken = page.nextPageToken;
        } while (pageToken);
        return inboxes;
    }

    public async ensureInbox(request: EnsureInboxRequest): Promise<Inbox> {
        const expectedLocalPart = request.username.toLowerCase();
        const existing = (await this.listAllInboxes()).find((inbox) => {
            const localPart = inbox.address.split("@", 1)[0]?.toLowerCase();
            return (
                (request.clientId && inbox.clientId === request.clientId) ||
                (localPart === expectedLocalPart && (!request.podId || inbox.podId === request.podId))
            );
        });
        if (existing) return existing;

        const { inbox } = await this.client.inboxes.create({
            username: request.username,
            podId: request.podId,
            domainId: request.domainId,
            clientId: request.clientId,
            displayName: request.displayName,
        });
        return inbox;
    }

    public async sendText(request: SendTextRequest): Promise<Message> {
        const { message } = await this.client.messages.send(request.inboxId, {
            to: Array.isArray(request.to) ? request.to : [request.to],
            subject: request.subject,
            text: request.text,
        });
        return message;
    }

    public discoverAgent(handle: string): Promise<A2AAgentCard> {
        return this.client.a2A.getAgentCard(handle);
    }
}
