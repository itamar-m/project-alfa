# Initialize docker service
sudo systemctl start docker

# Build an image, in quiet mode and tagging it
docker build -qt [image_name:tag] .

# Run an image in a container, under specific port and in background.
docker run -p [port of exposed service] -d [image_name:tag]

# Stop a container
  docker stop [container_id]

# Initialize minikube
minikube start

# Expose the service deployment as NodePort on minikube
kubectl expose deployment [deployment_name] --port=80 --type=NodePort
