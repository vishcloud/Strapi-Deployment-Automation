# 🚀 Strapi Local Setup – Config Crew

## 📋 Table of Contents
- [Project Overview](#-project-overview)
- [Prerequisites](#-prerequisites)
- [Detailed Setup Steps](#-detailed-setup-steps)
- [Project Structure](#-project-structure)
- [Content Type Creation](#-content-type-creation)
- [Running the Application](#-running-the-application)
- [Troubleshooting](#-troubleshooting)
- [Contributors](#-contributors)

## 🎯 Project Overview
This project demonstrates the practical implementation of a headless CMS using Strapi, including:

- Installation and setup of the Strapi development environment
- Configuration of local development tools and dependencies
- Creation and customization of content types
- Development and deployment of a fully functional Strapi application

## 🔧 Prerequisites
To run this project, you'll need:

- Node.js (v14 or later)
- npm or yarn package manager
- Git version control

## 📝 Detailed Setup Steps
### 1. Clone the Repository
```bash
# Clone the official Strapi repository
git clone https://github.com/strapi/strapi.git

# Navigate to the project directory
cd strapi
```

### 2. Environment Configuration
Ensure you're set up to use Yarn correctly:

```bash
# Enable corepack and prepare yarn
corepack enable
corepack prepare yarn@stable --activate

# Verify yarn installation
yarn --version
```

### 3. Install Dependencies
```bash
# Install all required dependencies using yarn
yarn install
```
This might take several minutes depending on your internet connection.

### 4. Launch the Application
```bash
# Start the development server
yarn develop

# Alternative command for starting the app
yarn start
```

### 5. Admin Panel Configuration
- Access the admin panel at http://localhost:1337/admin
- Create an administrator account with secure credentials.
- Opt for local-only development (skip Strapi Cloud setup).
- Configure language settings and basic preferences.

## 📁 Project Structure
After the setup, the key directories and files will include:

```
strapi/
├── .cache/             # Cache files for faster development
├── .tmp/               # Temporary files
├── api/                # API configurations and endpoints
├── build/              # Production build files
├── config/             # Configuration files
│   ├── admin.js        # Admin panel configuration
│   ├── database.js     # Database configuration
│   └── server.js       # Server settings
├── node_modules/       # Installed dependencies
├── public/             # Public assets
└── src/                # Source code
    ├── admin/          # Admin customizations
    ├── api/            # API customizations
    ├── components/     # Reusable components
    └── extensions/     # Plugin extensions
```

## 🧱 Content Type Creation
### Created "Article" Collection Type
1. Navigate to Content-Type Builder in the Strapi admin panel.
2. Click Create new collection type and name it Article.
3. Add the following fields:

   - **Title (Text)**:
     - Type: Short text
     - Required: Yes
     - Unique: Yes

   - **Content (Rich Text)**:
     - Type: Rich text
     - Required: Yes

   - **Published (Boolean)**:
     - Type: Boolean
     - Default: False

   - **Publication Date (Date)**:
     - Type: Date
     - Required: No

   - **Featured Image (Media)**:
     - Type: Media
     - Multiple media: No
     - Required: No

4. Save the changes and restart the Strapi server to apply the new schema.

## 💻 Running the Application
### Development Mode
```bash
# Navigate to the project directory
cd strapi

# Install dependencies (if not already done)
yarn install

# Start the development server
yarn develop
```

### Production Mode
```bash
# Build the application
yarn build

# Start the application in production mode
yarn start
```

Access the admin panel in the following environments:
- Development: http://localhost:1337/admin
- Production: http://your-domain.com/admin

## 🔍 Troubleshooting
### Common Issues and Solutions
1. **"yarn not found" error**:
   - Solution: Run `corepack enable` and `corepack prepare yarn@stable --activate` to ensure Yarn is correctly set up.

2. **Database connection issues**:
   - Solution: Verify that the database configuration is correct in `config/database.js`. Check for valid connection strings and credentials.

3. **Port already in use**:
   - Solution: Change the port in `config/server.js` or terminate the process using the default port.

## 👨‍💻 Contributors
**Rehan Khan**  
PearlThoughts DevOps Internship  
April 2025
