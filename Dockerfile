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

# Create custom folder
RUN mkdir -p /home/node/.n8n/custom

# LangChain community nodes (VALID)
RUN npm install --prefix /home/node/.n8n/custom n8n-nodes-langchain@latest

# AI Gateway nodes (VALID)
RUN npm install --prefix /home/node/.n8n/custom n8n-nodes-aigateway@latest

# (Optional) Additional generic AI helpers
RUN npm install --prefix /home/node/.n8n/custom n8n-nodes-chatgpt@latest


###############################
# FORCE RAILWAY REBUILD
###############################
RUN echo "railway_rebuild_2025_12_11" > /home/node/.n8n/rebuild.txt


# Expose Railway dynamic port
EXPOSE ${PORT}
