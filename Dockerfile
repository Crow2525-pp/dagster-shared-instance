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

COPY pyproject.toml ./
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --no-dev

RUN mkdir -p "${DAGSTER_HOME}"
COPY dagster.yaml workspace.yaml "${DAGSTER_HOME}/"

