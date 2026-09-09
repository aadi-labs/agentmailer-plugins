// Zod emits standalone JSON Schema $defs. Once embedded in OpenAPI, those
// document-root pointers must be relocated to named OpenAPI components.
export function fernOpenApi(input) {
  const document = structuredClone(input);
  const schemas = document.components?.schemas ?? {};
  const escape = (value) => value.replace(/~/g, "~0").replace(/\//g, "~1");
  for (const [name, schema] of Object.entries(schemas)) {
    if (!schema.$defs) continue;
    const definitions = schema.$defs;
    const refs = new Map(
      Object.keys(definitions).map((key) => [
        `#/$defs/${escape(key)}`,
        `#/components/schemas/${escape(`${name}_${key}`)}`,
      ]),
    );
    const rewrite = (value) => {
      if (!value || typeof value !== "object") return;
      if (typeof value.$ref === "string" && value.$ref.startsWith("#/$defs/")) {
        const target = refs.get(value.$ref);
        if (!target)
          throw new Error(`Unresolved definition in ${name}: ${value.$ref}`);
        value.$ref = target;
      }
      for (const child of Object.values(value)) rewrite(child);
    };
    rewrite(schema);
    delete schema.$defs;
    for (const [key, definition] of Object.entries(definitions)) {
      const target = `${name}_${key}`;
      if (Object.hasOwn(schemas, target))
        throw new Error(`Component collision: ${target}`);
      schemas[target] = definition;
    }
  }
  return document;
}
