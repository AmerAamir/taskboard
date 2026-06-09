import express from "express";
import cors from "cors";
import { config } from "./config.js";
import { pool, checkDatabase, initializeDatabase } from "./db.js";

const app = express();

app.use(cors({ origin: config.allowedOrigin }));
app.use(express.json());

function isValidStatus(status) {
  return ["todo", "doing", "done"].includes(status);
}

app.get("/health", (req, res) => {
  res.json({
    status: "ok",
    service: "taskboard-api",
    uptime: process.uptime(),
    timestamp: new Date().toISOString()
  });
});

app.get("/ready", async (req, res) => {
  try {
    const databaseReady = await checkDatabase();

    if (!databaseReady) {
      return res.status(503).json({
        status: "not ready",
        database: "not ready"
      });
    }

    res.json({
      status: "ready",
      database: "ready"
    });
  } catch (error) {
    res.status(503).json({
      status: "not ready",
      database: "not ready",
      error: error.message
    });
  }
});

app.get("/api/tasks", async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT * FROM tasks ORDER BY created_at DESC"
    );

    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch tasks" });
  }
});

app.get("/api/tasks/:id", async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT * FROM tasks WHERE id = $1",
      [req.params.id]
    );

    if (result.rowCount === 0) {
      return res.status(404).json({ message: "Task not found" });
    }

    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch task" });
  }
});

app.post("/api/tasks", async (req, res) => {
  try {
    const { title, description = "", status = "todo" } = req.body;

    if (!title || title.trim() === "") {
      return res.status(400).json({ message: "Title is required" });
    }

    if (!isValidStatus(status)) {
      return res.status(400).json({ message: "Invalid status" });
    }

    const result = await pool.query(
      `
      INSERT INTO tasks (title, description, status)
      VALUES ($1, $2, $3)
      RETURNING *
      `,
      [title, description, status]
    );

    res.status(201).json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ message: "Failed to create task" });
  }
});

app.put("/api/tasks/:id", async (req, res) => {
  try {
    const { title, description, status } = req.body;

    if (title !== undefined && title.trim() === "") {
      return res.status(400).json({ message: "Title cannot be empty" });
    }

    if (status !== undefined && !isValidStatus(status)) {
      return res.status(400).json({ message: "Invalid status" });
    }

    const result = await pool.query(
      `
      UPDATE tasks
      SET
        title = COALESCE($1, title),
        description = COALESCE($2, description),
        status = COALESCE($3, status),
        updated_at = NOW()
      WHERE id = $4
      RETURNING *
      `,
      [title, description, status, req.params.id]
    );

    if (result.rowCount === 0) {
      return res.status(404).json({ message: "Task not found" });
    }

    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ message: "Failed to update task" });
  }
});

app.delete("/api/tasks/:id", async (req, res) => {
  try {
    const result = await pool.query(
      "DELETE FROM tasks WHERE id = $1 RETURNING *",
      [req.params.id]
    );

    if (result.rowCount === 0) {
      return res.status(404).json({ message: "Task not found" });
    }

    res.json({ message: "Task deleted", task: result.rows[0] });
  } catch (error) {
    res.status(500).json({ message: "Failed to delete task" });
  }
});

async function startServer() {
  try {
    await initializeDatabase();

    app.listen(config.port, () => {
      console.log(`TaskBoard API running on port ${config.port}`);
    });
  } catch (error) {
    console.error("Failed to start API");
    console.error(error);
    process.exit(1);
  }
}

startServer();
