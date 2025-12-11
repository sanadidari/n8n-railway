FROM n8nio/n8n:1.74.0

# ======================================
# 1) Railway dynamic port configuration
# ======================================
ENV N8N_PORT=${PORT}
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# Fix warning in logs
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Force main process (Railway compatible)
ENV EXECUTIONS_PROCESS=main

# ======================================
# 2) Install community nodes (plugins)
# Add all plugins you want here
# ======================================
USER root

# Example: OpenAI community node
RUN npm install -g @tripetto/n8n-nodes-openai

# If you want more plugins, add them like this:
# RUN npm install -g \
#     @tripetto/n8n-nodes-openai \
#     n8n-nodes-chatgpt \
#     n8n-nodes-openai

USER node

# ======================================
# 3) Force Railway to rebuild container
# ======================================
RUN echo "force_rebuild_railway_2025" > /tmp/rebuild.txt

# ======================================
# 4) Expose dynamic port
# ======================================
EXPOSE ${PORT}
