import pg from "pg";

const { Pool } = pg;

export const pool = new Pool();

export async function checkDatabase() {
  const result = await pool.query("SELECT 1 AS ok");
  return result.rows[0].ok === 1;
}

export async function initializeDatabase() {
  await pool.query(`
    CREATE TABLE IF NOT EXISTS tasks (
      id SERIAL PRIMARY KEY,
      title VARCHAR(120) NOT NULL,
      description TEXT,
      status VARCHAR(20) NOT NULL DEFAULT 'todo',
      created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
      updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
      CONSTRAINT valid_status CHECK (status IN ('todo', 'doing', 'done'))
    );
  `);
}
