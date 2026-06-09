import { useEffect, useState } from "react";
import { api } from "./api";

function App() {
  const [tasks, setTasks] = useState([]);
  const [apiStatus, setApiStatus] = useState("checking");
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [error, setError] = useState("");

  async function checkApi() {
    try {
      const health = await api("/health");
      const ready = await api("/ready");
      setApiStatus(`${health.status}, ${ready.status}`);
    } catch (err) {
      setApiStatus("unavailable");
    }
  }

  async function loadTasks() {
    try {
      const data = await api("/api/tasks");
      setTasks(data);
      setError("");
    } catch (err) {
      setError(err.message);
    }
  }

  async function createTask(event) {
    event.preventDefault();

    try {
      await api("/api/tasks", {
        method: "POST",
        body: JSON.stringify({
          title,
          description,
          status: "todo"
        })
      });

      setTitle("");
      setDescription("");
      await loadTasks();
    } catch (err) {
      setError(err.message);
    }
  }

  async function updateStatus(id, status) {
    try {
      await api(`/api/tasks/${id}`, {
        method: "PUT",
        body: JSON.stringify({ status })
      });

      await loadTasks();
    } catch (err) {
      setError(err.message);
    }
  }

  async function deleteTask(id) {
    try {
      await api(`/api/tasks/${id}`, {
        method: "DELETE"
      });

      await loadTasks();
    } catch (err) {
      setError(err.message);
    }
  }

  useEffect(() => {
    checkApi();
    loadTasks();
  }, []);

  return (
    <main className="page">
      <section className="hero">
        <p className="eyebrow">3 tier DevOps learning app</p>
        <h1>TaskBoard</h1>
        <p>
          A simple task management app with a React frontend, Express API,
          PostgreSQL database, health endpoint, readiness endpoint, and
          environment based configuration.
        </p>

        <div className="statusBox">
          API status: <strong>{apiStatus}</strong>
        </div>
      </section>

      <section className="panel">
        <h2>Create task</h2>

        <form onSubmit={createTask} className="taskForm">
          <input
            value={title}
            onChange={(event) => setTitle(event.target.value)}
            placeholder="Task title"
          />

          <textarea
            value={description}
            onChange={(event) => setDescription(event.target.value)}
            placeholder="Task description"
          />

          <button type="submit">Add task</button>
        </form>

        {error && <p className="error">{error}</p>}
      </section>

      <section className="panel">
        <h2>Tasks</h2>

        {tasks.length === 0 ? (
          <p>No tasks yet.</p>
        ) : (
          <div className="taskList">
            {tasks.map((task) => (
              <article key={task.id} className="taskCard">
                <div>
                  <h3>{task.title}</h3>
                  <p>{task.description || "No description"}</p>
                  <span className={`status ${task.status}`}>
                    {task.status}
                  </span>
                </div>

                <div className="actions">
                  <select
                    value={task.status}
                    onChange={(event) =>
                      updateStatus(task.id, event.target.value)
                    }
                  >
                    <option value="todo">todo</option>
                    <option value="doing">doing</option>
                    <option value="done">done</option>
                  </select>

                  <button onClick={() => deleteTask(task.id)}>
                    Delete
                  </button>
                </div>
              </article>
            ))}
          </div>
        )}
      </section>
    </main>
  );
}

export default App;
