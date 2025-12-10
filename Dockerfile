# Railway-compatible n8n build
FROM n8nio/n8n:1.62.0

# Railway expects the app to listen on PORT env var
ENV N8N_PORT=8080
ENV PORT=8080
ENV N8N_HOST=0.0.0.0

# Expose correct port
EXPOSE 8080

# Start n8n
CMD ["n8n"]
