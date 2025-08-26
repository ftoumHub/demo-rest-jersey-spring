ALTER SYSTEM SET max_connections = 1000;
ALTER SYSTEM RESET shared_buffers;
CREATE DATABASE demo_rest_jersey;
CREATE USER demo_rest_jersey WITH PASSWORD 'demo_rest_jersey';
GRANT ALL PRIVILEGES ON DATABASE "demo_rest_jersey" to demo_rest_jersey;
