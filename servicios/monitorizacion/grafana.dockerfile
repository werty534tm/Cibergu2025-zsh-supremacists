# Elige una versión de Grafana que no sea Alpine, ej. 10.4.2
ARG GRAFANA_VERSION=10.4.2-ubuntu
FROM grafana/grafana-oss:${GRAFANA_VERSION}

# Cambiar a usuario root para instalar paquetes
USER root

# Actualizar e instalar las dependencias para grafana-image-renderer
# Esta es una lista bastante completa.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    fonts-liberation \
    # fonts-noto-color-emoji \ # Opcional, para emojis
    # fonts-noto-cjk \ # Opcional, para caracteres Chinos/Japoneses/Coreanos
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    lsb-release \
    wget \
    xdg-utils \
    # Dependencias adicionales que a veces son necesarias
    # libdrm2 \
    # libxkbcommon0 \
    # libu2f-udev \ # Para U2F, probablemente no necesario para el renderizador
    # Considerar chromium si el plugin no trae su propio binario o falla
    # chromium \
    && rm -rf /var/lib/apt/lists/*

# Volver al usuario grafana
USER grafana