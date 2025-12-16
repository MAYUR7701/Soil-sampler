# API Documentation

## User Registration

### Endpoint: /register/

- **Method:** POST
- **Description:** Register a new user.
- **Request:**
  - Body:
    ```json
    {
      "name": "John Doe",
      "email": "john@example.com",
      "password": "securepassword"
    }
    ```
- **Response:**

  - Success (HTTP 201 Created):

    ```json
    {
      "status": true,
      "data": {
        "message": "User registered successfully"
      }
    }
    ```

  - Error (HTTP 400 Bad Request):
    ```json
    {
      "status": false,
      "errors": {
        "email": ["This field is required."],
        "password": ["This field is required."]
      }
    }
    ```

## User Login

### Endpoint: /login/

- **Method:** POST
- **Description:** Log in a user.
- **Request:**
  - Body:
    ```json
    {
      "email": "john@example.com",
      "password": "securepassword",
      "captcha_id":"captcha_id",
      "captcha_answer":"captcha_answer"
    }
    ```
- **Response:**
  - Success (HTTP 200 OK):
    ```json
    {
      "status": true,
      "data": {
        "message": "Login successful"
      }
    }
    ```
  - Error (HTTP 400 Bad Request):
    ```json
    {
      "status": false,
      "error": "Invalid credentials"
    }
    ```

## User Logout

### Endpoint: /logout/

- **Method:** POST
- **Description:** Log out a user.
- **Authentication:** JWT token in cookies or Authentication header
- **Permissions:** Authenticated users only
- **Response:**
  - Success (HTTP 200 OK):
    ```json
    {
      "status": true,
      "data": {
        "message": "Logout successful"
      }
    }
    ```
  - Error (HTTP 400 Bad Request):
    ```json
    {
      "status": false,
      "error": "Invalid or missing tokens"
    }
    ```

## Generate Captcha

### Endpoint: /captcha/

- **Method:** POST
- **Description:** Generate a captcha for user registration.
- **Request:**
  - Body:
    ```json
    {
      "captcha_id": "optional-captcha-id",
      "captcha_answer": "user-provided-captcha-answer"
    }
    ```
- **Response:**
  - Success (HTTP 201 Created):
    ```json
    {
      "status": true,
      "data": {
        "captcha_id": "captcha-id",
        "captcha": "data:image/png;base64,captcha-image-base64"
      }
    }
    ```
  - Error (HTTP 400 Bad Request):
    ```json
    {
      "status": false,
      "error": "Invalid captcha"
    }
    ```

## Generate Sample

### Endpoint: /sample/generate/

- **Method:** POST
- **Description:** Generate a new sample.
- **Authentication:** JWT token in cookies or Authentication header
- **Permissions:** Authenticated user and Admin user and station staff only
- **Request:**
  - Body:
    ```json
    {
      "location": "Bh-002",
      "top_depth": "11"
    }
    ```
- **Response:**
  - Success (HTTP 201 Created):
    ```json
    {
      "status": true,
      "data": {
        "sample": {
          "id": "84cf99cf-5e47-46f2-86c1-2b271fa60df6",
          "sample_no": 5,
          "location": "Bh-002",
          "top_depth": 11,
          "is_completed": false,
          "created_at": "2023-12-25T14:55:01.689015Z"
        },
        "message": "Sample Created successfully"
      }
    }
    ```
  - Error (HTTP 400 Bad Request):
    ```json
    {
      "status": false,
      "error": "Invalid data provided"
    }
    ```

## Locate Sample

### Endpoint: /sample/locate/{sample_id}/

- **Method:** GET
- **Description:** Retrieve all sample station locators for a sample.
- **Authentication:** JWT token in cookies or Authentication header
- **Permissions:** Authenticated user and station staff only
- **Response:**
  - Success (HTTP 200 OK):
    ```json
    {
      "status": true,
      "data": [
        {
          "id": "3d1b1e86-79f8-4d5d-8c00-05d515496b38",
          "user_name": "Akash Yadav",
          "station_id": "7a184b4b-5e64-4732-8424-77f79472b43e",
          "station_name": "Storage Center",
          "is_completed": false,
          "created_at": "2023-12-25T14:55:01.694014Z"
        }
        //Other locators
      ]
    }
    ```
  - Error (HTTP 404 Not Found):
    ```json
    {
      "status": false,
      "error": "No Sample Station Locators found"
    }
    ```

## Update Scanned Sample Status

### Endpoint: /sample/scan/

- **Method:** PUT
- **Description:** Complete a sample or dispatch a sample
- **Authentication:** JWT token in cookies or Authentication header
- **Permissions:** Authenticated user and station staff only
- **Request:**
  - Body:
    ```json
    {
      "sample_station_locator_id": "3d1b1e86-79f8-4d5d-8c00-05d515496b38",
      "is_completed": true,
      "is_dispatched": true
    }
    ```
- **Response:**
  - Success (HTTP 200 OK):
    ```json
    {
      "status": true,
      "data": {
        "message": "Sample updated successfully"
      }
    }
    ```
  - Error (HTTP 400 Bad Request):
    ```json
    {
      "status": false,
      "error": "SampleStationLocator matching query does not exist."
    }
    ```

## Scan Sample

### Endpoint: /sample/scan/

- **Method:** POST
- **Description:** Scan a sample at a station.
- **Authentication:** JWT token in cookies or Authentication header
- **Permissions:** Authenticated user and station staff only
- **Request:**
  - Body:
    ```json
    {
      "sample_id": "84cf99cf-5e47-46f2-86c1-2b271fa60df6"
    }
    ```
- **Response:**
  - Success (HTTP 201 Created):
    ```json
    {
      "status": true,
      "data": {
        "message": "Scan completed successfully",
        "sample": {
          "id": "84cf99cf-5e47-46f2-86c1-2b271fa60df6",
          "sample_no": 5,
          "location": "Bh-002",
          "top_depth": 11,
          "is_completed": false,
          "created_at": "2023-12-25T14:55:01.689015Z"
        }
      }
    }
    ```
  - Error (HTTP 404 Not Found):
    ```json
    {
      "status": false,
      "error": "Sample not found"
    }
    ```

## Create Scanned Sample Tests

### Endpoint: /sample/test/

- **Method:** POST
- **Description:** Create a sample test.
- **Authentication:** JWT token in cookies or Authentication header
- **Permissions:** Authenticated user and station staff only
- **Request:**
  - Body:
    ```json
    {
      "sample_station_locator_id": "ddb961cc-b2bb-4319-9b57-99543a53ace6"
    }
    ```
- **Response:**
  - Success (HTTP 201 Created):
    ```json
    {
      "status": true,
      "data": {
        "message": "Sample Test created successfully",
        "data": {
          "id": "34bcc646-04eb-4fa6-a731-71d1f9a06eb3",
          "remarks": null,
          "is_completed": false,
          "created_at": "2023-12-25T17:31:00.567808Z",
          "updated_at": "2023-12-25T17:31:00.567808Z"
        }
      }
    }
    ```
  - Error (HTTP 400 Bad Request):
    ```json
    {
      "status": false,
      "error": "Station Locator Id not found"
    }
    ```

## Update Scanned Sample Tests

### Endpoint: /sample/test/

- **Method:** PUT
- **Description:** Update a sample test.
- **Authentication:** JWT token in cookies or Authentication header
- **Permissions:** Authenticated user and station staff only
- **Request:**
  - Body:
    ```json
    {
      "sample_test_id": "34bcc646-04eb-4fa6-a731-71d1f9a06eb3",
      "remarks": "There is update",
      "is_completed": true
    }
    ```
- **Response:**
  - Success (HTTP 201 Created):
    ```json
    {
      "status": true,
      "data": {
        "message": "Sample Test updated successfully",
        "data": {
          "id": "34bcc646-04eb-4fa6-a731-71d1f9a06eb3",
          "remarks": "There is update",
          "is_completed": true,
          "created_at": "2023-12-25T17:31:00.567808Z",
          "updated_at": "2023-12-25T17:37:40.543720Z"
        }
      }
    }
    ```
  - Error (HTTP 400 Bad Request):
    ```json
    {
      "status": false,
      "error": "Missing Sample Test Id"
    }
    ```

## Common for all APIs

- For all Error (HTTP 500 Bad Request):
  ```json
  {
    "status": false,
    "error": "error description"
  }
  ```
