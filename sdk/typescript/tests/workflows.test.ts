import { describe, expect, it, vi } from "vitest";

import type { AgentMailerClient } from "../src/Client.js";
import { AgentMailerWorkflows } from "../src/workflows.js";

const inbox = {
    id: "inb_existing",
    podId: "pod_test",
    address: "triage@agentmailer.ai",
    displayName: "Triage",
    clientId: "customer-42",
    metadata: {},
    status: "active" as const,
    createdAt: "2026-08-30T00:00:00Z",
    updatedAt: "2026-08-30T00:00:00Z",
};

describe("AgentMailerWorkflows", () => {
    it("returns an existing inbox without creating a duplicate", async () => {
        const create = vi.fn();
        const client = {
            inboxes: {
                list: vi.fn().mockResolvedValue({ inboxes: [inbox] }),
                create,
            },
        } as unknown as AgentMailerClient;

        const result = await new AgentMailerWorkflows(client).ensureInbox({
            username: "triage",
            clientId: "customer-42",
        });

        expect(result).toEqual(inbox);
        expect(create).not.toHaveBeenCalled();
    });

    it("follows inbox pagination before deciding whether to create", async () => {
        const list = vi
            .fn()
            .mockResolvedValueOnce({ inboxes: [], nextPageToken: "next" })
            .mockResolvedValueOnce({ inboxes: [inbox] });
        const client = { inboxes: { list, create: vi.fn() } } as unknown as AgentMailerClient;

        await new AgentMailerWorkflows(client).ensureInbox({ username: "triage" });

        expect(list).toHaveBeenNthCalledWith(2, { limit: 100, page_token: "next" });
    });

    it("preserves the caller idempotency key when sending text", async () => {
        const send = vi.fn().mockResolvedValue({ message: { id: "msg_sent" } });
        const client = { messages: { send } } as unknown as AgentMailerClient;

        await new AgentMailerWorkflows(client).sendText({
            inboxId: "inb_sender",
            idempotencyKey: "send-welcome-42",
            to: "recipient@example.com",
            subject: "Welcome",
            text: "Hello",
        });

        expect(send).toHaveBeenCalledWith("inb_sender", {
            "Idempotency-Key": "send-welcome-42",
            body: {
                to: ["recipient@example.com"],
                subject: "Welcome",
                text: "Hello",
            },
        });
    });
});
