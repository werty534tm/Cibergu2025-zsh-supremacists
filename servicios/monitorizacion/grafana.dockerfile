ARG GRAFANA_VERSION=10.4.2
FROM grafana/grafana-oss:${GRAFANA_VERSION}

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    libxss1 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libgtk-3-0 \
    libgbm1 \
    libasound2 \
    libatspi2.0-0 \
    libnss3 \
    libx11-xcb1 \
    chromium \
    && rm -rf /var/lib/apt/lists/*
USER grafana