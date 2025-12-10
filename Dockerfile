FROM n8nio/n8n:latest

# Railway uses PORT variable; map n8n to it
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http

# Start n8n
CMD ["n8n"]
