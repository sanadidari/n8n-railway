FROM n8nio/n8n:latest

# Expose N8N port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
