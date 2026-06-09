# TaskBoard

TaskBoard is a simple 3 tier task management app for DevOps learning.

## Tiers

Frontend:
React with Vite

Backend:
Node.js with Express

Database:
PostgreSQL

## Local ports

Frontend:
http://localhost:5173

Backend:
http://localhost:4000

Database:
localhost:5432

## Backend endpoints

GET /health

Checks whether the API process is alive.

GET /ready

Checks whether the API can connect to PostgreSQL.

GET /api/tasks

Lists all tasks.

POST /api/tasks

Creates a task.

GET /api/tasks/:id

Gets one task.

PUT /api/tasks/:id

Updates one task.

DELETE /api/tasks/:id

Deletes one task.

## Local run

Start PostgreSQL:

docker run --name taskboard-postgres -e POSTGRES_USER=taskuser -e POSTGRES_PASSWORD=taskpass -e POSTGRES_DB=taskdb -p 5432:5432 -d postgres:16-alpine

Run backend:

cd backend
npm install
npm run dev

Run frontend:

cd frontend
npm install
npm run dev

## DevOps purpose

This app is intentionally simple.

It exists so we can practice Docker, Docker Compose, Kubernetes, EKS, GitHub Actions, Terraform, health checks, readiness checks, environment variables, logs, monitoring, and troubleshooting.
