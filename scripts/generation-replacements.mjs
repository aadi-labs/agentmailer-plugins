export function replaceRequired(source, from, to, label) {
  const candidates = (Array.isArray(from) ? [...from] : [from]).sort((a, b) => b.length - a.length);
  if (source.includes(to) && !candidates.some(candidate => candidate.includes(to) && source.includes(candidate))) return source;
  const match = candidates.find(candidate => source.includes(candidate));
  if (match) return source.replace(match, to);
  if (source.includes(to)) return source;
  throw new Error(`Unable to post-process ${label}; expected content is missing`);
}
