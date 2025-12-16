# # Stage 1: Install frontend dependencies and build frontend assets
# FROM node AS frontend_builder
# WORKDIR /app/frontend
# COPY frontend/package.json frontend/package-lock.json ./
# RUN npm install
# COPY frontend .
# RUN npm run build

# Stage 2: Install backend dependencies
FROM python AS backend_builder
WORKDIR /app/backend
COPY backend .
COPY /frontend/dist /app/backend/frontend/dist
RUN pip install -r requirements.txt

# Stage 3: Custom entrypoint script to wait for MySQL service
FROM backend_builder AS final
COPY /backend/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
