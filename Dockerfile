FROM n8nio/n8n:1.74.0

# Force n8n to use Railway dynamic port
ENV N8N_PORT=${PORT}
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# Fix permissions warning
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Required for Railway
ENV EXECUTIONS_PROCESS=main

###############################
# INSTALL COMMUNITY AI NODES
###############################

RUN mkdir -p /home/node/.n8n/custom

# LangChain (community)
RUN npm install --prefix /home/node/.n8n/custom n8n-nodes-langchain

# AI Gateway (useful for multi-models)
RUN npm install --prefix /home/node/.n8n/custom n8n-nodes-aigateway

# Generic AI nodes pack
RUN npm install --prefix /home/node/.n8n/custom n8n-nodes-ai

###############################
# OPTIONAL (OpenAI official SDK)
###############################

RUN npm install --prefix /home/node/.n8n/custom @openai/openai
RUN npm install --prefix /home/node/.n8n/custom @langchain/openai
RUN npm install --prefix /home/node/.n8n/custom @langchain/community

###############################
# FORCE RAILWAY REBUILD
###############################
RUN echo "force_rebuild_railway_2025" > /home/node/force.txt

EXPOSE ${PORT}
