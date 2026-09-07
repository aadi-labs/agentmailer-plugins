import { test } from 'node:test';
import assert from 'node:assert/strict';
import { replaceRequired } from './generation-replacements.mjs';

test('replaces the entire Ruby call, including its arguments', () => {
  const from = ['client.agent.bootstrap', 'client.agent.bootstrap(idempotency_key: "Idempotency-Key")'];
  const to = 'response = client.inboxes.list\nputs response.inboxes';
  const result = replaceRequired('client.agent.bootstrap(idempotency_key: "Idempotency-Key")', from, to, 'Ruby');
  assert.equal(result, to);
  assert.equal(replaceRequired(result, from, to, 'Ruby'), to);
});
test('repairs a partial replacement even when the target is a substring', () => {
  assert.equal(replaceRequired('puts response.inboxes(idempotency_key: "Idempotency-Key")',
    'puts response.inboxes(idempotency_key: "Idempotency-Key")', 'puts response.inboxes', 'Ruby'), 'puts response.inboxes');
});
test('does not rewrite unrelated examples when quickstart is already processed', () => {
  const output = 'response = client.inboxes.list\nputs response.inboxes';
  const document = output + '\nresult = client.agent.bootstrap';
  assert.equal(replaceRequired(document, 'client.agent.bootstrap', output, 'Ruby'), document);
});
