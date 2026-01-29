# Microservices Design Patterns & Architecture Rules

> Principles, patterns, and guidelines for microservices architecture in the AntiGravity ecosystem.

---

## 🏗️ Fundamental Principles

1. **Single Responsibility**: Each service has a single, clear business responsibility (Bounded Context).
2. **Autonomous**: Services must be independent for deployment, scaling, and failure.
3. **API First**: The API contract (gRPC proto, OpenAPI, AsyncAPI) must be defined before implementation.
4. **Resilience**: Design for failures (Circuit Breaker, Retries, Timeouts).
5. **Observability**: Every service must be visible (Logs, Metrics, Traces).

---

## 📡 Cross-Service Communication

### Synchronous (Internal)
- **Protocol**: gRPC is preferred for service-to-service communication due to performance and strong typing.
- **Service Discovery**: Use the orchestrator's native mechanism (e.g., Kubernetes DNS).

### Synchronous (External/Public)
- **Protocol**: REST/JSON (OpenAPI).
- **Gateway**: All external communication must pass through an API Gateway.

### Asynchronous (Event-Driven)
- **Protocol**: NATS, RabbitMQ, or Kafka.
- **Pattern**: Event Sourcing or Transactional Outbox to ensure eventual consistency.
- **Idempotency**: Every event consumer MUST be idempotent.

---

## 🛠️ Resilience Patterns

- **Retries**: Implement retries with Exponential Backoff and Jitter.
- **Circuit Breaker**: Protect dependent services from cascading failures.
- **Timeouts**: Every external request MUST have a defined timeout.
- **Dead Letter Queues (DLQ)**: Messages that fail permanently must go to a DLQ.

---

## 📊 Observability (The Three Pillars)

### 1. Logs
- **Format**: JSON (Structured Logging).
- **Content**: Must include `trace_id`, `service_name`, `severity`, `timestamp`.
- **Level**: `info` in production, `debug` only in development/staging.

### 2. Metrics
- **Exposition**: `/metrics` endpoint for Prometheus.
- **Patterns**: RED (Rate, Errors, Duration) for services and USE (Utilization, Saturation, Errors) for resources.

### 3. Tracing
- **Pattern**: OpenTelemetry.
- **Propagation**: Trace context must be propagated in all calls (HTTP, gRPC, Pub/Sub).

---

## 🔒 Security

- **mTLS**: Use for internal communication between pods whenever possible.
- **JWT**: For end-user authentication.
- **Secrets Management**: Never put secrets in plain environment variables or config files. Use Vault or Kubernetes Secrets.
- **Least Privilege**: Services should run with the minimum necessary permissions.

---

## 💾 Data Management

- **Database per Service**: Each microservice has its own database. Never share databases between services.
- **Migrations**: Mandatory schema version control (e.g., Flyway, Liquibase, Atlas).
- **CQRS**: Consider for complex reading involving multiple aggregates.

---

## 🚀 Deployment & DevOps

- **Infrastructure as Code (IaC)**: Terraform or Pulumi.
- **Containerization**: Docker multi-stage builds for lean images.
- **CI/CD**: Automated deployments with integration tests and static analysis.
- **Health Checks**: Implement `/health/live` and `/health/ready`.

---

**Last update:** 2026-01-16  
**Version:** 1.0
