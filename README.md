# dagster-shared-instance

Shared Dagster host for multiple gRPC code locations. This repo owns only:

- `dagster-webserver`
- `dagster-daemon`
- the Dagster metadata Postgres instance
- the shared `workspace.yaml`

Application code lives in separate repos and joins the same Docker network.

## Managed code locations

- `personal-finance` at `personal-finance:4000`
- `coles-shopper` at `coles-shopper:4000`

## Setup

```bash
cp .env.example .env
docker compose up -d --build
```

Bring the module repos up on the same Docker network named by `DAGSTER_NETWORK`.

