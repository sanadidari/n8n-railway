# Railway-compatible n8n build
<<<<<<< HEAD
FROM n8nio/n8n:1.84.1

# Railway uses the PORT environment variable
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0

# Replace this with your real Railway URL
ENV WEBHOOK_URL=https://your-app.up.railway.app/

# Expose the port Railway assigns
EXPOSE ${PORT}
=======
FROM n8nio/n8n:1.62.0

# Railway expects the app to listen on PORT env var
ENV N8N_PORT=8080
ENV PORT=8080
ENV N8N_HOST=0.0.0.0

# Expose correct port
EXPOSE 8080
>>>>>>> 5328cbf (update: working Dockerfile for Railway)

# Start n8n
CMD ["n8n"]
