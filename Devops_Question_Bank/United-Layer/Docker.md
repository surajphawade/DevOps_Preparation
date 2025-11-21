# Docker / Containers – United Layer

## Q1. What is Docker?
### Answer
Containerization platform to package apps with dependencies.
### Follow-Up Points
- Lightweight vs VM  
### Example
docker run nginx

---

## Q2. What is Dockerfile?
### Answer
Script used to build Docker images.
### Follow-Up Points
- Use multi-stage for optimization  
### Example
FROM node:18

---

## Q3. Dockerfile instructions?
### Answer
FROM, RUN, COPY, ADD, CMD, ENTRYPOINT, EXPOSE, ENV, WORKDIR.
### Follow-Up Points
- Best practice: small images  
### Example
RUN apt-get update.

---

## Q4. Multistage Dockerfile?
### Answer
Reduce image size by using separate build & runtime stages.
### Follow-Up Points
- Secure & lightweight  
### Example
FROM builder → FROM alpine.

---

## Q5. CMD vs ENTRYPOINT?
### Answer
CMD → default arguments  
ENTRYPOINT → fixed command.
### Follow-Up Points
- Combine both  
### Example
ENTRYPOINT ["python"]; CMD ["app.py"].

---

## Q6. ADD vs COPY?
### Answer
COPY: strict copy  
ADD: copy + URL + auto tar extract.
### Follow-Up Points
- Prefer COPY  
### Example
ADD file.tar.gz /tmp.

