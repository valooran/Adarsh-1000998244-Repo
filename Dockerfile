# ------------------------------
# STEP 1 — Build the application
# ------------------------------
FROM node:18-alpine AS build

# Set working directory inside the container
WORKDIR /app

# Copy package files first and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Optional: if you are using a React build step
# RUN npm run build

# ------------------------------
# STEP 2 — Run the application
# ------------------------------
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy everything from the build step
COPY --from=build /app .

# Expose the port the app runs on (change if your app uses a different port)
EXPOSE 8080

# Start the application
CMD ["npm", "start"]