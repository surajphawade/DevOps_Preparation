# Docker / Containers – Persistent Systems Interview Questions

## Q1. How do you use Docker in your current project?
### Answer
We use Docker to package applications into containers, build images from Dockerfiles, push them to ACR/Docker Hub, and run them in Kubernetes.
### Follow-Up Points
- CI/CD builds the Docker image  
- Security scanning on images  
- Use multi-stage Dockerfiles for optimization  
- Push images to ACR for AKS usage
### Example
docker build -t myapp:v1 .  
docker push myregistry.azurecr.io/myapp:v1

---

## Q2. Explain Dockerfile.
### Answer
Dockerfile defines the steps to build a Docker image (base image, dependencies, app code, entrypoint).
### Follow-Up Points
- Build context impacts performance  
- Reuse layers for caching  
- Keep image small (use alpine)
### Example
FROM node:16-alpine  
COPY . /app  
WORKDIR /app  
RUN npm install  
CMD ["npm","start"]

---

## Q3. Purpose of multistage Dockerfile?
### Answer
Multistage builds reduce image size by separating build environment and runtime environment.
### Follow-Up Points
- Improves security  
- Reduces final image size  
- Avoids shipping build tools in image
### Example
# stage 1  
FROM golang:1.16 as builder  
RUN go build -o app  
# stage 2  
FROM alpine  
COPY --from=builder /app /app

---

## Q4. How do you create Dockerfile and edit Dockerfile?
### Answer
You write a Dockerfile in plain text using instructions like FROM, RUN, COPY, CMD. Editing is done via any text editor.
### Follow-Up Points
- Validate using docker build  
- Use .dockerignore  
- Follow best practices
### Example
touch Dockerfile  
nano Dockerfile

---

## Q5. Difference between CMD and ENTRYPOINT with example.
### Answer
CMD provides default arguments that can be overridden; ENTRYPOINT defines a fixed command that always runs.
### Follow-Up Points
- ENTRYPOINT + CMD = recommended  
- CMD alone can be replaced by docker run arguments  
- ENTRYPOINT forces command execution
### Example
ENTRYPOINT ["python"]  
CMD ["app.py"]  
→ docker run image myscript.py overrides CMD only

