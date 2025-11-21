# Docker / Containers – EPAM

## Q1. What are different Docker networks?
### Answer
Bridge, Host, Overlay, Macvlan, and None network types.
### Follow-Up Points
- Bridge = default  
- Overlay = multi-host  
### Example
docker network ls

---

## Q2. Difference between ADD and COPY?
### Answer
COPY copies files; ADD can copy + extract archives + download from URLs.
### Follow-Up Points
- Prefer COPY for clarity  
### Example
COPY . /app  
ADD file.tar.gz /extract/

---

## Q3. Difference between CMD and ENTRYPOINT?
### Answer
CMD → default arguments  
ENTRYPOINT → main command that always runs.
### Follow-Up Points
- Combine ENTRYPOINT + CMD  
### Example
ENTRYPOINT ["python"]  
CMD ["app.py"]

---

## Q4. Purpose of multistage Dockerfile?
### Answer
Reduces image size by separating build and runtime stages.
### Follow-Up Points
- Improves security  
- Faster deployments  
### Example
FROM builder → compile → copy to small runtime image.

