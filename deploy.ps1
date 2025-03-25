# Build the Docker image
Write-Host "Building Docker image..." -ForegroundColor Green
docker build -t spring-hello-app .

# Apply Kubernetes configurations
Write-Host "Applying Kubernetes configurations..." -ForegroundColor Green
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml

# Wait for deployment to be ready
Write-Host "Waiting for deployment to be ready..." -ForegroundColor Yellow
kubectl rollout status deployment/spring-hello

# Get deployment status
Write-Host "`nChecking deployment status:" -ForegroundColor Cyan
kubectl get deployments
kubectl get pods

# Get service status and URL
Write-Host "`nChecking service status:" -ForegroundColor Cyan
kubectl get services spring-hello-service

Write-Host "`nApplication should be accessible at http://localhost:8080" -ForegroundColor Green