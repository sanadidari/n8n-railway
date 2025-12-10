# ----------------------------
# n8n on Railway - Correct Dockerfile
# ----------------------------

FROM n8nio/n8n:latest

# Set the correct port for Railway
ENV N8N_PORT=8080
ENV PORT=8080

# Expose Railway port
EXPOSE 8080

# Start n8n normally
CMD ["n8n"]
