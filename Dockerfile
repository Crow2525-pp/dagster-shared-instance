FROM ghcr.io/astral-sh/uv:python3.11-bookworm-slim

ARG DAGSTER_HOME=/opt/dagster/dagster_home

ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    UV_LINK_MODE=copy \
    UV_COMPILE_BYTECODE=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PATH="/app/.venv/bin:$PATH" \
    DAGSTER_HOME=${DAGSTER_HOME}

WORKDIR /app

# Build from the lock. An unlocked `uv sync` resolves the newest Dagster on
# every rebuild; on 2026-10-02 that pulled dagster-postgres 0.29.25, which needs
# psycopg 3, and the webserver and daemon crash-looped on start.
COPY pyproject.toml uv.lock ./
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-dev

RUN mkdir -p "${DAGSTER_HOME}"
COPY dagster.yaml workspace.yaml "${DAGSTER_HOME}/"
