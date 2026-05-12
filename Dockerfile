# Use the version you want
FROM n8nio/n8n:latest

# Switch to root to prepare the filesystem
USER root

# Create a dedicated 'nodes' folder in the n8n user directory.
# This folder is specifically checked by n8n for community nodes.
RUN mkdir -p /home/node/.n8n/nodes && \
    cd /home/node/.n8n/nodes && \
    npm init -y && \
    npm install n8n-nodes-docx-converter \
                @apify/n8n-nodes-apify \
                n8n-nodes-waha \
                n8n-nodes-docxtemplater

# Ensure the 'node' user owns these files so n8n can load them
RUN chown -R node:node /home/node/.n8n

# Switch back to the standard user
USER node
