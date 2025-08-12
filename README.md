# Nginx Load Balancer with Multiple Ubuntu Nginx Containers using Docker Compose

This project demonstrates a simple load balancing setup using Docker Compose with Nginx:

- Three Ubuntu containers each running Nginx, serving different static `index.html` pages.
- One Nginx container acting as a load balancer proxying requests to the backend containers.

## Project Structure

- `docker-compose.yml`: Defines all services and the user-defined network.
- `nginx.conf`: Nginx configuration for backend containers.
- `loadbalancer.conf`: Nginx configuration for the load balancer with upstream backend servers.
- `assets/index1.html`, `index2.html`, `index3.html`: Static HTML files served by backend containers.

## How to Use

1. Clone the repository:

   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   cd <repo-name>


Start the setup using Docker Compose:

docker-compose up --build

Open your browser and navigate to:

    http://localhost:8002

    Refresh the page multiple times to see the load balancer cycling through backend containers serving different static pages.

Stop the containers

docker-compose down

Notes

    Backend containers install Nginx at runtime on top of the Ubuntu base image. For faster startup, consider building a custom Docker image with Nginx pre-installed.

    The load balancer uses the official nginx:latest image.

    All containers communicate over a custom Docker bridge network named nginx-network.

Feel free to open issues or contribute via pull requests!
