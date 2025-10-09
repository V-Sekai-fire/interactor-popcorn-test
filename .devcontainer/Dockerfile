FROM ubuntu:noble AS base

ENV ERLANG_VERSION="26.0.2"
ENV ELIXIR_VERSION="1.17.3-otp-26"
ENV NODE_VERSION="22"
ENV EMSDK_VERSION="4.0.16"
ENV MIX_ENV=dev
ENV LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND='noninteractive'
ENV PATH="/root/.local/share/mise/shims:/opt/emsdk:/opt/emsdk/upstream/emscripten:$PATH"
ENV MISE_TRUSTED_CONFIG_PATHS='/workspaces/popcorn-test'
ENV EMSDK_QUIET='1'

WORKDIR /workspaces/popcorn-test

RUN apt-get -y update && \
    apt-get -y install git curl cmake gperf libmbedtls-dev zlib1g-dev \
    automake make gcc g++ libssl-dev libncurses-dev \
    python3 xz-utils gpg wget build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install mise
RUN install -dm 755 /etc/apt/keyrings && \
    wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor > /etc/apt/keyrings/mise-archive-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=amd64,arm64] https://mise.jdx.dev/deb stable main" > /etc/apt/sources.list.d/mise.list && \
    apt update && \
    apt install -y mise && \
    rm -rf /var/lib/apt/lists/*

# Install Node
RUN mise use --global node@"${NODE_VERSION}" && mise install

# Install Erlang
RUN mise use --global erlang@"${ERLANG_VERSION}" && mise install

# Install Elixir
RUN mise use --global elixir@"${ELIXIR_VERSION}" && \
    mise install && \
    mix local.rebar --force && \
    mix local.hex --if-missing --force

# Install Rebar3
RUN mise use --global rebar@latest && mise install

# Install Emscripten SDK
RUN git clone https://github.com/emscripten-core/emsdk.git /opt/emsdk && \
    cd /opt/emsdk && \
    ./emsdk install ${EMSDK_VERSION} && \
    ./emsdk activate ${EMSDK_VERSION}
