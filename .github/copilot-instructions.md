# Project Guidelines

## Stack and Scope
- This is an Astro 6 static site project with TypeScript strict settings.
- Keep route files in `src/pages/`, reusable UI in `src/components/`, and shared wrappers in `src/layouts/`.
- Prefer `.astro` components for page and UI work unless there is a clear reason to introduce another file type.

## Build and Validation
- Use Node.js `>=22.12.0` and Yarn for local development.
- Primary commands:
  - `yarn dev` for local development (`localhost:4321` by default)
  - `yarn build` for production output to `dist/`
  - `yarn preview` to validate the built output locally
  - `yarn astro -- --check` before finishing non-trivial changes
- There is no configured test suite yet; if adding logic-heavy code, add a focused validation approach and document it.

## Deployment and Runtime
- Production deploy is a static build served by Nginx (see `Dockerfile` and compose files).
- Do not introduce runtime-only Node server assumptions for production pages.
- Keep `yarn.lock` in sync with dependency changes because Docker uses `yarn install --frozen-lockfile`.

## Asset and Content Conventions
- Put directly served static files in `public/`.
- Put source-managed/imported assets in `src/assets/`.
- Keep user-facing copy edits consistent with existing language usage in the repository.

## Safety and Secrets
- Never commit real tokens, API keys, or credentials in docs or source files.
- Replace sensitive examples with placeholders (for example, `<TOKEN>`).

## Documentation
- Repository docs are currently lightweight. Link to `README.md` for baseline project commands instead of duplicating large blocks.
