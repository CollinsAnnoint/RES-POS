FROM node:20-slim
WORKDIR /app

# Runtime dependency (MongoDB driver, used only when MONGODB_URI is set).
COPY package.json package-lock.json ./
RUN npm install --omit=dev
COPY server.js index.html sw.js manifest.json holiday-photo-gallery.html ./
COPY assets ./assets

ENV NODE_ENV=production \
    PORT=8000 \
    DATA_DIR=/data

VOLUME /data
EXPOSE 8000
CMD ["node", "server.js"]
