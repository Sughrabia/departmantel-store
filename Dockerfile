
# Use the official Node.js image.
FROM node:20

# Set the working directory.
WORKDIR /app

# Copy package.json and package-lock.json.
COPY package*.json ./

# Install dependencies.
RUN npm install

# Copy the rest of the application files.
COPY . .

# Build the React app for production.
RUN npm run build

# Use a simple HTTP server to serve the build folder.
RUN npm install -g serve

# Serve the app.
CMD ["serve", "-s", "build"]

# Expose the port the app runs on.
EXPOSE 5000
