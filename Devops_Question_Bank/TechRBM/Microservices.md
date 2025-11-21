# Microservices – TechRBM Interview Questions

## Q1. (General) Questions about different microservices
### Answer
Microservices are small, independently deployable services each responsible for a single capability. They communicate over well-defined APIs or messaging (Kafka). Use containers and orchestrators (K8s) for deployment and scaling.
### Follow-Up Points
- Consider API Gateway, service discovery, tracing, and circuit breakers.  
- Separate data stores per bounded context if needed.  
- Use async messaging for decoupling (Kafka).
### Example
Auth Service, Orders Service, Payment Service communicating via Kafka topics and REST APIs.

