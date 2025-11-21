# Docker / Containers – LTI Mindtree Interview Questions

## Q1. Why multistage Dockerfile?
### Answer
Multistage Dockerfiles reduce final image size by separating build and runtime environments. Build tools stay in the build stage and never reach the final image.
### Follow-Up Points
- Improves security  
- Faster deployments  
- Smaller image → lower storage cost  
### Example
FROM golang AS builder  
RUN go build -o app  
FROM alpine  
COPY --from=builder /app /app

---

## Q2. Docker networking concepts.
### Answer
Docker networking allows containers to communicate using different drivers: bridge, host, overlay, and macvlan.
### Follow-Up Points
- Default network = bridge  
- Overlay used in Swarm  
- Host mode removes isolation  
### Example
docker network ls

---

## Q3. Difference between ADD and COPY.
### Answer
`COPY` simply copies files from source to image.  
`ADD` can copy + extract archives + fetch URLs.
### Follow-Up Points
- Prefer COPY for clarity  
- ADD has extra behaviors → avoid unless needed  
### Example
COPY . /app  
ADD file.tar.gz /extract/

---

## Q4. Difference between CMD and ENTRYPOINT.
### Answer
CMD = default arguments  
ENTRYPOINT = main command that always runs
### Follow-Up Points
- ENTRYPOINT + CMD combination recommended  
- CMD can be overridden easily  
### Example
ENTRYPOINT ["python"]  
CMD ["app.py"]

---

## Q5. Have you used HEALTHCHECK in Dockerfile?
### Answer
Yes — HEALTHCHECK monitors container health by running periodic commands.
### Follow-Up Points
- Helps detect unhealthy containers  
- Works with orchestrators like Kubernetes  
### Example
HEALTHCHECK CMD curl -f http://localhost/ || exit 1

---

## Q6. Have you used Docker Compose?
### Answer
Yes — Docker Compose defines multi-container applications using a YAML file.
### Follow-Up Points
- Useful for local development  
- Supports scaling & environment variable injection  
### Example
docker-compose up -d

