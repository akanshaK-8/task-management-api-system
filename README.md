# Task Manager API

A RESTful API built with Laravel that allows users to register, log in, and manage their tasks securely using token-based authentication.

---

## 🚀 Features

- User Registration
- User Login (Token Authentication)
- Create Tasks
- Update Tasks
- Delete Tasks
- View User's all Tasks
- View User-Specific Tasks
- Protected API Routes
- Database Feature Testing

---

## 🛠 Tech Stack

- Laravel 12.0
- PHP 8.2
- MySQL
- Laravel Sanctum (API Authentication)
- PHPUnit (Feature Testing)

---

## 📦 Installation

### 1️⃣ Clone the repository

```bash
git clone https://github.com/akanshaK-8/task-management-api-system.git
cd task-management-api-system
```

### 2️⃣ Install dependencies

```bash
composer install
```

### 3️⃣ Create environment file

```bash
cp .env.example .env
```

### 4️⃣ Generate application key

```bash
php artisan key:generate
```

### 5️⃣ Configure database

Update your `.env` file:

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=task_management
DB_USERNAME=root
DB_PASSWORD=
```

### 6️⃣ Run migrations

```bash
php artisan migrate
```

### 7️⃣ Install Sanctum (if not already installed)

```bash
php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"
php artisan migrate
```

### 8️⃣ Start the server

```bash
php artisan serve
```

---

## 🔐 Authentication

This App uses token-based authentication.

After login, the API returns an `access_token`.

Include the token in protected requests:

```
Authorization: Bearer YOUR_ACCESS_TOKEN
```

---

## 📚 API Endpoints

### 🔑 Authentication

| Method | Endpoint        | Description |
|--------|-----------------|------------|
| POST   | /api/register   | Register new user |
| POST   | /api/login      | Login user |

### ✅ Tasks (Protected)

| Method | Endpoint        | Description |
|--------|-----------------|------------|
| GET    | /api/tasks      | Get user tasks |
| GET    | /api/tasks/{id} | Get user single task |
| POST   | /api/tasks      | Create task |
| PATCH  | /api/tasks/{id} | Update task |
| DELETE | /api/tasks/{id} | Delete task |
| POST   | /api/logout     | Logout      |

---

## 🔐 Authentication Flow

1.  User registers via `/api/register`
2.  User logs in via `/api/login`
3.  Server returns a Bearer Token
4.  Token must be included in headers: Authorization: Bearer {token}
5.  User logs out via `/api/logout`

---

## 🧪 Running Tests

```bash
php artisan test
```

## 🗂 Database Structure

### Users Table
- id
- name
- email
- password
- timestamps

### Tasks Table
- id
- user_id
- title
- description
- status
- due_date
- timestamps
- deleted_at

---

## 📌 Notes

- Each task belongs to an authenticated user.
- Unauthorized users cannot access task routes.
- Validation is applied to all request inputs.
- Used Laravel logging for api errors.

---

## 🚀 Bonus Features

- Task filtering via status or due_date or both.
- Pagination in user's all task response
- SoftDelete for task.
---

## API Documentation
- A ready-to-use Postman collection is included in the root of this repository.
- After getting success response from Register or login endpoint copy the `access_token` and update in the Authorization tab of postman collection "Task Management Api"
- This will inherit the authorization header for all the protected apis.


### HTTP status code
| Code  | Description             | 
|-------|-------------------------|
| 200   | success                 |
| 400   | bad request             |
| 401   | unauthorized            |
| 404   | not found               |
| 422   | input validation error  |
| 500   | internal server error   |

---

## 👨‍💻 Author

Akansha

---

## 📄 License

This project is open-source and available under the MIT License.

