# Use the official n8n image
FROM n8nio/n8n:latest

# Switch to root to perform installations
USER root

# Install these specific community nodes
# Navigate to the n8n directory to ensure npm installs them into the correct scope
RUN cd /usr/local/lib/node_modules/n8n && \
    npm install n8n-nodes-docx-converter \
                @apify/n8n-nodes-apify \
                n8n-nodes-waha \
                n8n-nodes-docxtemplater

# Switch back to the 'node' user for security best practices
USER node
