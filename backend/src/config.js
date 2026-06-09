import dotenv from "dotenv";

dotenv.config();

export const config = {
  port: process.env.PORT || 4000,
  allowedOrigin: process.env.ALLOWED_ORIGIN || "http://localhost:5173"
};
