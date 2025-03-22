FROM node:20-alpine AS base

WORKDIR /

# Copy package.json first
COPY docker.package.json ./package.json

# Check if package-lock.json exists, if not, generate it
RUN [ -f package-lock.json ] || npm install --package-lock-only

# Copy package-lock.json only if it exists
COPY package-lock.json* ./

# Install dependencies
RUN npm ci || npm install

COPY . .

# Development stage
FROM base AS development
CMD ["npm", "run", "start"]

# # Production stage
# FROM base AS build
# RUN npm run build

# # Use Nginx to serve static files
# FROM nginx:alpine
# WORKDIR /usr/share/nginx/html

# # Copy build output from the previous stage
# COPY --from=build /app/build .

# # Expose port for web server
# EXPOSE 80

# # Start Nginx
# CMD ["nginx", "-g", "daemon off;"]
