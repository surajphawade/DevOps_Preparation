# Docker — Unknown / Mixed-Source Questions (Questions + Answers)

Q1. What is Docker?
A1. A platform to build, ship, and run containers packaging applications with their dependencies.

Q2. What is Dockerfile?
A2. A text file with instructions to build a Docker image.

Q3. What is Docker image?
A3. A read-only template created from a Dockerfile used to instantiate containers.

Q4. What are Dockerfile instructions?
A4. Commands such as FROM, RUN, COPY, ADD, ENV, WORKDIR, CMD, ENTRYPOINT, EXPOSE.

Q5. Difference between CMD & ENTRYPOINT?
A5. CMD provides default arguments; ENTRYPOINT defines the executable; together they produce the final run command.

Q6. Difference between ADD & COPY?
A6. COPY copies files; ADD also supports remote URLs and auto-extracting archives — COPY is preferred for simplicity.

Q7. What is a multistage Dockerfile?
A7. A build that uses multiple FROM stages to compile and then copy artifacts into a smaller runtime image.

Q8. Docker networking types?
A8. Bridge, Host, Overlay, Macvlan, and None.

Q9. What is containerization vs virtualization?
A9. Virtualization emulates hardware to run full OSes (VMs); containerization isolates processes on the host OS, sharing kernel and being more lightweight.

