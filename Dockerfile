# Railway-compatible n8n build (x86 compatible)
FROM n8nio/n8n:1.74.0

# Railway dynamic port support
ENV N8N_PORT=${PORT}
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0

# Railway static URL (public domain)
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# Expose Railway-assigned port
EXPOSE ${PORT}

# Do not override CMD — official entrypoint launches n8n
