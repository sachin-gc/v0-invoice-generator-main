FROM node:20-alpine

WORKDIR /app

# Install python3 and build tools needed for native modules
RUN apk add --no-cache python3 make g++

# Copy package.json and package-lock.json for npm install
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy all source files
COPY . .

# Build your app (if applicable)
RUN npm run build

# Expose port (adjust if needed)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
