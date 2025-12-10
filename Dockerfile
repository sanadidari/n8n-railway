# Railway-compatible n8n build
FROM n8nio/n8n:1.62.0

# Railway expects the app to listen on PORT env var
ENV N8N_PORT=8080
ENV PORT=8080
ENV N8N_EDITOR_BASE_URL=""
ENV N8N_PUBLIC_URL=""

# Expose correct port
EXPOSE 8080

# Start n8n production server
CMD ["n8n"]
