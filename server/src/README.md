# Upkeep API Documentation

This document provides an overview of the REST API endpoints for the Upkeep building documentation system. The API is designed to help users document every aspect of a building—from overall properties to floors, rooms, assets (e.g., boilers, elevators), maintenance records, service providers, and associated media. It also includes full user management and authentication.

---

## Table of Contents

- [Authentication](#authentication)
- [Users](#users)
- [Properties](#properties)
- [Floors](#floors)
- [Rooms](#rooms)
- [Assets](#assets)
- [Maintenance](#maintenance)
- [Service Providers](#service-providers)
- [Media](#media)
- [Extended Use Cases](#extended-use-cases)

---

## Authentication

### POST /auth/login

- **Description:**  
  Authenticates a user using a username and password. On success, returns a JWT access token.

- **Use Case:**  
  Allows a user to log in to the system. The returned JWT is then used for subsequent authenticated requests.

- **Request Body Example:**

  ```json
  {
    "username": "prince",
    "password": "password"
  }
  ```

- **Response Example:**

  ```json
  {
    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  }
  ```

- **Notes:**  
  - The local strategy validates credentials and checks that the user is not disabled.
  - On successful login, the last login timestamp is updated.

---

## Users

### GET /users

- **Description:**  
  Retrieves a list of all users.

- **Use Case:**  
  Used by administrators to view all registered users.

- **Response Example:**

  ```json
  [
    {
      "id": 1,
      "username": "prince",
      "role": "user",
      "email": "prince@example.com",
      "createdAt": "2025-02-13T21:28:09.520Z",
      "lastLogin": "2025-02-13T21:30:00.000Z"
    }
  ]
  ```

---

### GET /users/{id}

- **Description:**  
  Retrieves details for a single user by ID.

- **Use Case:**  
  View detailed user information (for example, on a user profile page).

- **Parameters:**  
  - `id` (path): ID of the user.

---

### POST /users

- **Description:**  
  Creates a new user (registration).

- **Use Case:**  
  Allows a new user to register in the system.

- **Request Body Example:**

  ```json
  {
    "username": "prince",
    "password": "password",
    "role": "user",
    "email": "prince@example.com"
  }
  ```

---

### PUT /users/{id}

- **Description:**  
  Updates information for an existing user.

- **Use Case:**  
  Allows updating of user details (e.g., email, role). Note that the update DTO is built from the create DTO so all fields are optional.

- **Parameters:**  
  - `id` (path): ID of the user.

- **Request Body Example (UpdateUserDto):**

  ```json
  {
    "email": "new_email@example.com"
  }
  ```

- **Notes:**  
  If an empty object is submitted, a 400 Bad Request will be returned.

---

### PUT /users/{id}/disable

- **Description:**  
  Disables a user account (for administrative purposes).

- **Use Case:**  
  Prevents a user from logging in without deleting their record.

- **Parameters:**  
  - `id` (path): ID of the user to disable.

---

### PUT /users/{id}/enable

- **Description:**  
  Re-enables a previously disabled user account.

- **Use Case:**  
  Allows administrators to restore access to a disabled user.

- **Parameters:**  
  - `id` (path): ID of the user to enable.

---

## Properties

### GET /properties

- **Description:**  
  Retrieves a list of all properties (buildings).

- **Use Case:**  
  Used on the dashboard to display all properties managed in the system.

---

### POST /properties

- **Description:**  
  Creates a new property.

- **Use Case:**  
  Allows users to register a new building with details such as name, address, description, building type, and associated images/documents.

- **Request Body Example (CreatePropertyDto):**

  ```json
  {
    "name": "Central Plaza",
    "address": "123 Main Street",
    "description": "A commercial building in downtown.",
    "buildingType": "commercial",
    "images": [
      { "url": "http://example.com/image1.jpg", "caption": "Front view" },
      { "url": "http://example.com/image2.jpg", "caption": "Lobby" }
    ]
  }
  ```

---

### GET /properties/{id}

- **Description:**  
  Retrieves detailed information for a specific property, including its floors.

- **Parameters:**  
  - `id` (path): ID of the property.

---

### PUT /properties/{id}

- **Description:**  
  Updates property details.

- **Use Case:**  
  Allows editing details such as name, address, description, or images.

- **Parameters:**  
  - `id` (path): ID of the property.

- **Request Body Example (UpdatePropertyDto):**

  ```json
  {
    "description": "An updated description of the property."
  }
  ```

---

### DELETE /properties/{id}

- **Description:**  
  Deletes a property.

- **Use Case:**  
  Removes a property from the system along with its associated floors and rooms.

- **Parameters:**  
  - `id` (path): ID of the property.

---

## Floors

*(Note: Floors are nested under properties.)*

### GET /properties/{propertyId}/floors

- **Description:**  
  Retrieves all floors for a specific property.

- **Parameters:**  
  - `propertyId` (path): ID of the property.

---

### POST /properties/{propertyId}/floors

- **Description:**  
  Creates a new floor for a property.

- **Use Case:**  
  Allows users to add a floor to a building, providing a floor number, name (label), and description.

- **Parameters:**  
  - `propertyId` (path): ID of the property.

- **Request Body Example (CreateFloorDto):**

  ```json
  {
    "floorNumber": 1,
    "name": "Main Lobby",
    "description": "This floor contains the lobby and reception."
  }
  ```

---

## Rooms

*(Note: Rooms are nested under floors.)*

### GET /floors/{floorId}/rooms

- **Description:**  
  Retrieves all rooms on a given floor.

- **Parameters:**  
  - `floorId` (path): ID of the floor.

---

### POST /floors/{floorId}/rooms

- **Description:**  
  Creates a new room on a given floor.

- **Use Case:**  
  Used to document a room’s details (e.g., name, area, paint color, flooring).

- **Parameters:**  
  - `floorId` (path): ID of the floor.

- **Request Body Example (CreateRoomDto):**

  ```json
  {
    "roomName": "Conference Room 101",
    "area": "350 sqft",
    "paintColor": "White",
    "flooring": "Carpet"
  }
  ```

---

### GET /floors/{floorId}/rooms/{id}

- **Description:**  
  Retrieves details for a specific room.

- **Parameters:**  
  - `floorId` (path): ID of the floor.
  - `id` (path): ID of the room.

---

### PUT /floors/{floorId}/rooms/{id}

- **Description:**  
  Updates details for a specific room.

- **Parameters:**  
  - `floorId` (path): ID of the floor.
  - `id` (path): ID of the room.

- **Request Body Example (UpdateRoomDto):**

  ```json
  {
    "paintColor": "Light Blue"
  }
  ```

---

### DELETE /floors/{floorId}/rooms/{id}

- **Description:**  
  Deletes a room.

- **Parameters:**  
  - `floorId` (path): ID of the floor.
  - `id` (path): ID of the room.

---

## Assets

*(Note: With polymorphic associations, assets can belong to a room, floor, or property.)*

### GET /assets

- **Description:**  
  Retrieves a list of assets. Supports optional filtering by owner type and owner ID.

- **Query Parameters:**  
  - `ownerType` (optional): Type of the parent entity (e.g., "room", "floor", "property").
  - `ownerId` (optional): ID of the parent entity.

---

### POST /assets

- **Description:**  
  Creates a new asset.  
- **Use Case:**  
  Allows users to document an item (e.g., elevator, boiler, window) and specify the associated parent (room, floor, or property).

- **Request Body Example (CreateAssetDto):**

  ```json
  {
    "name": "Elevator",
    "assetType": "elevator",
    "description": "Main service elevator",
    "manufacturer": "ElevatorCo",
    "model": "X100",
    "installationDate": "2023-05-01T00:00:00.000Z",
    "warrantyExpiration": "2028-05-01T00:00:00.000Z",
    "ownerType": "floor",
    "ownerId": 2
  }
  ```

---

### GET /assets/{id}

- **Description:**  
  Retrieves details for a specific asset.

- **Parameters:**  
  - `id` (path): ID of the asset.

---

### PUT /assets/{id}

- **Description:**  
  Updates an asset's details.

- **Parameters:**  
  - `id` (path): ID of the asset.

- **Request Body Example (UpdateAssetDto):**

  ```json
  {
    "description": "Updated description for the asset"
  }
  ```

---

### DELETE /assets/{id}

- **Description:**  
  Deletes an asset.

- **Parameters:**  
  - `id` (path): ID of the asset.

---

## Maintenance

*(Note: Maintenance records can be attached to assets or, in our current design, directly to a room. They can be adapted to assets if needed.)*

### GET /rooms/{roomId}/maintenance

- **Description:**  
  Retrieves all maintenance records for a given room.

- **Parameters:**  
  - `roomId` (path): ID of the room.

---

### POST /rooms/{roomId}/maintenance

- **Description:**  
  Creates a maintenance record for a room.

- **Parameters:**  
  - `roomId` (path): ID of the room.

- **Request Body Example (CreateMaintenanceDto):**

  ```json
  {
    "date": "2025-02-10T00:00:00.000Z",
    "cost": 250.75,
    "performedBy": "AC Maintenance Co.",
    "notes": "Replaced air filters."
  }
  ```

---

### GET /rooms/{roomId}/maintenance/{id}

- **Description:**  
  Retrieves a specific maintenance record.

- **Parameters:**  
  - `roomId` (path): ID of the room.
  - `id` (path): ID of the maintenance record.

---

### PUT /rooms/{roomId}/maintenance/{id}

- **Description:**  
  Updates a maintenance record.

- **Parameters:**  
  - `roomId` (path): ID of the room.
  - `id` (path): ID of the maintenance record.

- **Request Body Example (UpdateMaintenanceDto):**

  ```json
  {
    "notes": "Replaced filters and cleaned ducts."
  }
  ```

---

### DELETE /rooms/{roomId}/maintenance/{id}

- **Description:**  
  Deletes a maintenance record.

- **Parameters:**  
  - `roomId` (path): ID of the room.
  - `id` (path): ID of the maintenance record.

---

## Service Providers

### GET /service-providers

- **Description:**  
  Retrieves a list of all service providers.

- **Use Case:**  
  Used to view all companies or individuals available for maintenance, repairs, etc.

---

### POST /service-providers

- **Description:**  
  Creates a new service provider.

- **Request Body Example (CreateServiceProviderDto):**

  ```json
  {
    "name": "Maintenance Solutions",
    "contactInfo": "contact@maintsol.com",
    "description": "Provides HVAC and plumbing services."
  }
  ```

---

### GET /service-providers/{id}

- **Description:**  
  Retrieves details for a specific service provider.

- **Parameters:**  
  - `id` (path): ID of the service provider.

---

### PUT /service-providers/{id}

- **Description:**  
  Updates a service provider’s details.

- **Parameters:**  
  - `id` (path): ID of the service provider.

- **Request Body Example (UpdateServiceProviderDto):**

  ```json
  {
    "contactInfo": "newcontact@maintsol.com"
  }
  ```

---

### DELETE /service-providers/{id}

- **Description:**  
  Deletes a service provider.

- **Parameters:**  
  - `id` (path): ID of the service provider.

---

## Media

### GET /media

- **Description:**  
  Retrieves a list of all media records.

- **Use Case:**  
  Used to view all uploaded media files (images, documents, etc.).

---

### POST /media

- **Description:**  
  Uploads a new media file and attaches it to an entity (e.g., a property, room, asset).

- **Request Body Example (CreateMediaDto):**

  ```json
  {
    "url": "http://example.com/document.pdf",
    "caption": "Inspection report",
    "entityId": 3,
    "entityType": "asset",
    "metadata": { "mimeType": "application/pdf", "size": 102400 }
  }
  ```

---

### GET /media/{id}

- **Description:**  
  Retrieves details for a specific media record.

- **Parameters:**  
  - `id` (path): ID of the media record.

---

### PUT /media/{id}

- **Description:**  
  Updates media details.

- **Parameters:**  
  - `id` (path): ID of the media record.

- **Request Body Example (UpdateMediaDto):**

  ```json
  {
    "caption": "Updated caption for document"
  }
  ```

---

### DELETE /media/{id}

- **Description:**  
  Deletes a media record.

- **Parameters:**  
  - `id` (path): ID of the media record.

---

## Extended Use Cases (Future)

### Assets on Multiple Levels

- **Concept:**  
  With the polymorphic Asset model, assets can be associated with a room, floor, or property.
  
- **Example Use Cases:**  
  - A **room asset** might be a computer or printer inside a specific room.  
  - A **floor asset** could be an elevator serving an entire floor.  
  - A **property asset** might be a roof or a parking lot that pertains to the whole building.
  
- **Endpoint Usage:**  
  - The endpoint `GET /assets` supports query parameters such as `ownerType` and `ownerId` to filter assets.
  - The `POST /assets` endpoint requires the request body to specify `ownerType` and `ownerId` so the asset can be linked appropriately.

### Audit and History Endpoints

- **Concept:**  
  In a full‑featured enterprise application, you might want to track changes to records (e.g., asset updates, maintenance logs).
  
- **Potential Endpoints:**  
  - `GET /audit/changes` to list recent changes.
  - `GET /audit/users/{id}` to view the audit trail for a specific user.
  
- **Note:**  
  This functionality may be implemented using database triggers, an audit table, or an event‑sourcing approach.

### Scheduling and Warranty Tracking

- **Concept:**  
  Additional endpoints could be added to manage scheduled maintenance or track warranty expirations for assets.
  
- **Potential Endpoints:**  
  - `GET /assets/{id}/warranty` to check warranty status.
  - `POST /schedules` to create a maintenance schedule.
