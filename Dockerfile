FROM n8nio/n8n:1.74.0

# ===================================================
#   1) CONFIGURATION RAILWAY (PORT, HOST, WEBHOOKS)
# ===================================================
ENV N8N_PORT=${PORT}
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV EXECUTIONS_PROCESS=main

# ===================================================
#   2) INSTALLATION DES COMMUNITY NODES (AI PLUGINS)
# ===================================================
USER root
RUN mkdir -p /home/node/.n8n/custom

# OpenAI official nodes
RUN npm install --prefix /home/node/.n8n/custom n8n-nodes-openai

# LangChain official
RUN npm install --prefix /home/node/.n8n/custom @n8n/nodes-langchain

# ChatGPT community
RUN npm install --prefix /home/node/.n8n/custom n8n-nodes-chatgpt

# LangChain community ext (advanced LLM tools)
RUN npm install --prefix /home/node/.n8n/custom n8n-nodes-langchain-community

# Fix permissions
RUN chown -R node:node /home/node/.n8n

USER node

# ===================================================
#   3) FORCE REBUILD POUR RAILWAY
# ===================================================
RUN echo "force_rebuild_railway_2025_v2" > /home/node/.n8n/rebuild.txt

EXPOSE ${PORT}
