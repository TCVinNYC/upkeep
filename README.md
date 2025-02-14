# Upkeep

**Upkeep** is a comprehensive building documentation system designed for self‑hosted, personal documentation of your properties. This repository contains the **Core API Server** (built with Node.js and NestJS) and is complemented by a Flutter application for an intuitive, cross‑platform experience. The API allows you to manage everything from properties and floors to rooms, assets, maintenance records, service providers, and media—while also handling user authentication and management.

## Table of Contents

- [Upkeep](#upkeep)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
    - [Core Functionalities](#core-functionalities)
    - [Non-Core Functionalities (Planned for Future Phases)](#non-core-functionalities-planned-for-future-phases)
  - [Roadmap](#roadmap)
    - [Phase 1: Core API Setup (In-Progress)](#phase-1-core-api-setup-in-progress)
    - [Phase 2: Feature Expansion](#phase-2-feature-expansion)
    - [Phase 3: Flutter App Integration \& Extended Use Cases](#phase-3-flutter-app-integration--extended-use-cases)
    - [Phase 4: DevOps Enhancements](#phase-4-devops-enhancements)
    - [Phase 5: Continuous Improvement](#phase-5-continuous-improvement)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
    - [Clone the Repository](#clone-the-repository)
    - [Environment Configuration](#environment-configuration)
    - [Testing Endpoints](#testing-endpoints)

## Features

### Core Functionalities

1. **User Authentication & Authorization**
   - **Secure Login:** Implements JWT-based authentication for secure API access.
   - **Account Management:** Support for registration, profile management, and enabling/disabling user accounts.

2. **User Management**
   - **CRUD Operations:** Create, read, update, and delete user profiles.
   - **Session Tracking:** Update last login timestamps and monitor account activities.

3. **Property Management**
   - **Building Documentation:** Create and manage properties with details such as name, address, description, and images.
   - **Hierarchical Structure:** Link properties with floors and rooms for detailed documentation.

4. **Floor and Room Documentation**
   - **Floor Management:** Add and edit floors within a property, including floor numbers, names, and descriptions.
   - **Room Management:** Document room details (e.g., name, area, paint color, flooring) nested under specific floors.

5. **Asset Management**
   - **Polymorphic Associations:** Document assets (e.g., boilers, elevators) that can be associated with a room, floor, or property.
   - **CRUD Operations:** Create, retrieve, update, and delete asset records with detailed metadata.

6. **Maintenance Records**
   - **Record Keeping:** Log maintenance activities including dates, costs, service provider details, and notes.
   - **Room-based Records:** Initially, maintenance records are linked directly to rooms with future plans for asset-level logging.

7. **Service Provider Management**
   - **Directory Management:** Create and manage records for service providers including contact information and service descriptions.

8. **Media Handling**
   - **Document Uploads:** Upload and manage media files (images, documents) associated with properties, assets, or maintenance records.
   - **Metadata Support:** Store and update media metadata such as mime types and file sizes.

9. **API Documentation**
   - **Interactive Swagger UI:** Explore and test API endpoints via an interactive documentation interface available at `/docs`.

10. **Flutter Application Integration**
    - **Cross-Platform Experience:** A dedicated Flutter app offers a seamless UI for managing property documentation on mobile and desktop.
    - **Real-Time Synchronization:** Ensures data consistency between the API and the app for a smooth user experience.

### Non-Core Functionalities (Planned for Future Phases)

- **Audit and History Endpoints:** Track changes to records such as asset updates and maintenance logs.
- **Scheduling and Warranty Tracking:** Manage scheduled maintenance tasks and monitor warranty expirations.
- **Advanced Analytics & Reporting:** Visualize maintenance trends and property performance metrics.
- **Integration with IoT Devices:** Connect with IoT sensors for real-time monitoring of property conditions.

## Roadmap

### Phase 1: Core API Setup (In-Progress)

- **Project Initialization:** Establish the NestJS project with a modular structure.
- **Authentication & User Management:** Implement secure user authentication and basic CRUD operations.
- **Property, Floor, and Room Endpoints:** Build core endpoints for managing properties, floors, and rooms.
- **Basic Asset, Maintenance, and Media Handling:** Set up endpoints to document assets, maintenance records, and media files.
- **API Documentation:** Configure Swagger UI for interactive API exploration.

### Phase 2: Feature Expansion

- **Enhanced Endpoint Coverage:** Expand endpoints for more granular management of assets and maintenance logs.
- **Service Provider Module:** Introduce comprehensive service provider management.
- **Improved Data Validation:** Refine DTOs and validation mechanisms for better API reliability.

### Phase 3: Flutter App Integration & Extended Use Cases

- **Flutter App Release:** Launch the Flutter application for self-hosted, personal property documentation.
- **Real-Time Sync:** Enhance synchronization between the API and Flutter app.
- **User Interface Enhancements:** Improve the UX/UI based on user feedback.

### Phase 4: DevOps Enhancements

- **Dockerized Deployment:** Containerize services using Docker and Docker Compose.
- **CI/CD Pipeline:** Implement automated testing and deployment workflows.
- **Kubernetes Integration (Future):** Explore orchestration solutions for scalability and high availability.

### Phase 5: Continuous Improvement

- **Performance Optimization:** Optimize both API and Flutter app performance.
- **Security Enhancements:** Integrate advanced security measures (e.g., HTTPS, OAuth2).
- **Analytics & Auditing:** Deploy advanced analytics, audit trails, and reporting features.

## Prerequisites

- **Docker & Docker Compose:** For containerized deployment.
  - [Download Docker](https://www.docker.com/get-started)
- **Node.js & npm:** Required for running the API locally.
  - [Download Node.js](https://nodejs.org/)
- **Flutter SDK:** To build and run the mobile/desktop application.
  - [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

## Installation

### Clone the Repository

```bash
git clone https://github.com/tcvinnyc/upkeep.git
cd upkeep
```

### Environment Configuration

1. **API Setup:**
   - Navigate to the API directory:

     ```bash
     cd server
     ```

   - Create a `.env` file and configure the following (adjust as necessary):

     ```env
     PORT=3000
     DATABASE_URL=your_database_connection_string
     JWT_SECRET=your_jwt_secret
     ```

   - Install dependencies and start the API:

     ```bash
     npm install
     npm start
     ```

   - Alternatively, run via Docker:

     ```bash
     docker-compose -f docker-compose.yml up --build
     ```

2. **Flutter App Setup:**
   - Navigate to the Flutter app directory:

     ```bash
     cd mobile
     ```

   - Install Flutter dependencies:

     ```bash
     flutter pub get
     ```

   - Run the Flutter app:

     ```bash
     flutter run
     ```

### Testing Endpoints

Once the API is running, explore the interactive documentation at:

```bash
http://localhost:3000/api
```
