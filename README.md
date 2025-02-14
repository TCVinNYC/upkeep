# Guardian AI

**Guardian AI** is a comprehensive traffic incident detection system leveraging IP cameras and AI processors to monitor and manage traffic incidents in real-time. This repository houses the **Core API Server (for now)**, built with NestJS, responsible for user authentication, camera management, incident reporting, notifications, and more.

## Table of Contents

- [Guardian AI](#guardian-ai)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
    - [Core Functionalities](#core-functionalities)
    - [Non-Core Functionalities (Planned for Future Phases)](#non-core-functionalities-planned-for-future-phases)
  - [Roadmap](#roadmap)
    - [Phase 1: Core Setup (In-Progress)](#phase-1-core-setup-in-progress)
    - [Phase 2: Feature Expansion](#phase-2-feature-expansion)
    - [Phase 3: AI Integration \& Analytics](#phase-3-ai-integration--analytics)
    - [Phase 4: DevOps Enhancements](#phase-4-devops-enhancements)
    - [Phase 5: Continuous Improvement](#phase-5-continuous-improvement)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)

## Features

### Core Functionalities

1. **User Authentication & Authorization**
   - **Secure Login:** Implements JWT-based authentication for secure access.
   - **Role-Based Access Control (RBAC):** Differentiates permissions between admins and operators.

2. **User Management**
   - **CRUD Operations:** Create, read, update, and delete user profiles.
   - **Session Tracking:** Monitor and manage user sessions.
   - **User Downloads:** Facilitate user access to downloadable content as needed.

3. **Camera Management**
   - **Registration & Configuration:** Register new cameras, manage their settings, and organize camera setups.
   - **Health Monitoring:** Continuously monitor the health and connectivity status of each camera.
   - **Incident Reporting:** Receive and handle incident reports from connected cameras.

4. **Incident Handling**
   - **Logging Incidents:** Record incident details reported by cameras.
   - **Incident Retrieval:** Retrieve and review incident reports.
   - **Status Updates:** Update the status of incidents (e.g., pending, resolved).

5. **Notification System**
   - **Incident Notifications:** Notify relevant users/admins when incidents are detected.
   - **Notification Channels:** Placeholder for integrating various notification channels to operators for UI queue as well as distribution messages (e.g., email, SMS).

6. **AI Integration**
   - **Message Queue Communication:** Integrate with AI camera processors via message queues (e.g., RabbitMQ, Kafka).
   - **Real-Time Processing:** Handle real-time video stream processing and incident detection.

7. **Configuration Management**
   - **Environment Variables:** Manage configurations securely using environment variables.
   - **Dynamic Configuration:** Adjust configurations without restarting the server.

8. **API Documentation**
   - **Swagger UI:** Interactive documentation available at `/docs` for exploring and testing endpoints.

9. **Logging & Monitoring**
   - **Structured Logging:** Utilize Winston for comprehensive logging with different log levels.
   - **Log Rotation:** Implement daily log rotation to manage log file sizes.
   - **Health Checks:** Use NestJS Terminus for monitoring application and database health.

10. **Scalability & High Availability**
    - **Dockerized Services:** Each service runs in independent Docker containers for isolation and scalability.
    - **Future Kubernetes Integration:** Plan to manage deployments, scaling, and failover using Kubernetes.

### Non-Core Functionalities (Planned for Future Phases)

- **Analytics & Reporting:** Advanced data processing and visualization of incident trends.
- **License Management:** Handle licensing for cameras and software usage.
- **Versioning:** Track and manage software versions for both server and cameras.
- **CI/CD Pipelines:** Automated build, test, and deployment processes.
- **Microservices Architecture:** Extract specific functionalities into microservices for enhanced scalability.

## Roadmap

### Phase 1: Core Setup (In-Progress)

- **Project Initialization:** Set up NestJS project with a modular structure.
- **Authentication & User Management:** Implement secure authentication and basic user CRUD operations.
- **Camera & Incident Management:** Develop camera registration, health monitoring, and incident logging features.
- **Basic Notification Stub:** Placeholder for future notification integrations.
- **Configuration & Logging:** Integrate environment configuration and structured logging.
- **API Documentation:** Set up Swagger for interactive API docs.

### Phase 2: Feature Expansion

- **Notification System:** Integrate actual notification channels (e.g., email, SMS).
- **License Management:** Implement licensing features for camera usage.
- **Versioning Module:** Add software version tracking for server and cameras.

### Phase 3: AI Integration & Analytics

- **AI Services Integration:** Connect with AI camera processors via message queues.
- **Data Analytics:** Develop modules for processing and visualizing incident data.
- **Incident Reporting Enhancements:** Advanced reporting and filtering options.

### Phase 4: DevOps Enhancements

- **CI/CD Pipelines:** Set up automated pipelines using GitHub Actions or similar tools.
- **Kubernetes Deployment:** Transition to Kubernetes for container orchestration, scaling, and high availability.
- **Advanced Monitoring:** Integrate Prometheus and Grafana for real-time monitoring and alerting.

### Phase 5: Continuous Improvement

- **Microservices Architecture:** Extract additional functionalities into separate microservices.
- **Security Enhancements:** Implement advanced security measures (e.g., HTTPS, OAuth2).
- **Performance Optimization:** Optimize application and database performance based on monitoring insights.

## Prerequisites

- **Docker & Docker Compose:** Ensure Docker and Docker Compose are installed on your system.
  - [Download Docker](https://www.docker.com/get-started)
- **Node.js & npm:** Required for running scripts and tests outside Docker (optional).
  - [Download Node.js](https://nodejs.org/)

## Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Guardian-AI-Group/guardian.git
   cd guardian
   ```

2. **Open .env and adjust the configuration as needed**
   ```bash
    DB_HOST=db
    DB_PORT=5432
    DB_USERNAME=postgres
    DB_PASSWORD=postgres
    DB_DATABASE=guardian_ai
    JWT_SECRET=supersecretkey
    APP_PORT=3000
    NODE_ENV=development
    LOG_LEVEL=debug
    ```

3. **Running the Server**
    ```bash
    docker-compose -f docker-compose.dev.yml up --build
    ```
4. **Testing Endpoints**
   ```bash
   http://localhost:3000/docs
   ```
