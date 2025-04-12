##                      Cheatsheet


##  --------------------- Auth -------------------------------

gcloud auth application-default login && gcloud auth login

## --------------------- Running ----------------------------

uv run gcloud_functions/end2end/run.py

## --------------------- Turbo ------------------------------

turbo typecheck
turbo @mm/backend#remotedev @mm/companion-frontend#dev

## --------------------- Testing ----------------------------
 
uv --directory mm/ run mypy .
uv run ruff check --fix

## ---------------------- uv sync ---------------------------

uv run scripts/update_local_dependencies.py . uv-run 'lock' --execute

## --------------------- Supabase ---------------------------

## Update types
pnpm gen:internal

## New migration
pnpm supabase migration new update_flow_synthesis

## Start 
pnpm supabase start

## Start from scratch | good for testing new migration files
pnpm supabase db reset

