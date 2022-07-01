# Fiddling with gqlgen

Experimenting a bit with gqlgen for generating GraphQL code from spec.

## Notes

- Would prefer to move `gqlgen.yml` and `schema.graphql` into a spec/ directory (or other areas)
- Installation method with `tools.go` - not sure about this, static binary is preferrable for my usages
- Generated models are pretty solid, similar to swagger
- Resolvers is nice, but what about partial updates?

I'm not entirely sold on this pattern. Feel like I'd prefer more _flexibility_ with how the models and various components are defined. Almost interested in the idea of instead of using annotations like `json` or `yaml`, leveraging generated code for rendering the JSON/YAML components. Then isolating the various elements of what the system is expected to do, things like:

- Data Serialization
- Patch & Diff Pattern for Models (e.g. receive patch, apply patch to model)
- Hexagonal architecture

Maybe this is a case where Roslyn is a better fit for specialized code generation with a hexagonal architecture in-mind? More research needed into this.
