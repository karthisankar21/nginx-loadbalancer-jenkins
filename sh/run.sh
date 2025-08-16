#!/bin/bash
# Nginx Load Balancer Pipeline Script
# Usage: ./nginx_pipeline.sh [start] [test] [clean]

set -e  # Exit if any command fails

# Check if no arguments are provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 [start] [test] [clean]"
    exit 1
fi

# Loop through provided arguments
for arg in "$@"; do
    case $arg in
        start)
            echo "=== Starting Nginx Load Balancer ==="
            # --- Content from start.sh ---
            # Example: Docker commands to start Nginx load balancer
            docker-compose up --build -d
            echo "Start complete!"
            ;;
        test)
            echo "=== Testing Nginx Load Balancer ==="
            # --- Content from test.sh ---
            # Example: curl command or health check
            for i in {1..5}; do echo "Request: $i"; curl -s http://localhost:8002; sleep 1; done
            echo "Test complete!"
            ;;
        clean)
            echo "=== Cleaning Nginx Load Balancer ==="
            # --- Content from clean.sh ---
            docker-compose down
            echo "Clean complete!"
            ;;
        *)
            echo "Unknown option: $arg"
            echo "Valid options: start, test, clean"
            exit 1
            ;;
    esac
done

echo "All selected steps completed!"
