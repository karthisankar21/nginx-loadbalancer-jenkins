#!/bin/bash
echo "Testing nginx load balancer..."

for i in {1..5}; do echo "Request: $i"; curl -s http://localhost:8002; sleep 1; done