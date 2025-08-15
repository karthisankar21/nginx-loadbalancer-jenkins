#!/bin/bash

for i in {1..10}; do
    echo "Attempt $i: Checking Nginx..."

    status=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8002)

    if [ "$status" -eq 200 ]; then
        echo "✅ Nginx is ready!"
        exit 0
    else
        echo "❌ Nginx not ready (HTTP $status), waiting 1 min..."
        sleep 60
    fi
done

echo "❌ Nginx failed to start in time"
exit 1
