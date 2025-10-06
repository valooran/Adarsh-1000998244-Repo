# Use Node.js official image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Use PORT environment variable provided by Cloud Run (defaults to 8080)
ENV PORT=8080
EXPOSE $PORT

# Start the application
CMD ["npm", "start"]