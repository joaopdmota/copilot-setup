# 🏛️ Architecture & Dependency Rules (Nexus Standard)

> Guidelines for scalable, maintainable, and decoupled Go backend architecture, based on Clean Architecture and Ports & Adapters.

---

## 🏗️ Layered Sovereignty

The project must strictly follow the dependency direction: **Infrastructure -> Application -> Domain**.

### 1. Domain (The Pure Core)
- **Content**: Entities, Value Objects, and Domain Services.
- **Rules**:
    - **Zero Dependencies**: Must not import anything from other layers or heavy third-party libs (except basic utilities).
    - **Business Invariants**: All business rules must be validated here.

### 2. Application (The Orchestrator)
- **Content**: Use Cases, Ports (Interfaces), and Application DTOs.
- **Rules**:
    - **Interface-Driven**: Defines the "Ports" (Repository/Service interfaces) that Infrastructure must implement.
    - **Orchestration Only**: Should not contain low-level technical details (SQL, HTTP status codes, etc.).

### 3. Infrastructure (The Detail)
- **Content**: DB Adapters, Repository Implementations, External Clients.
- **Rules**:
    - **Dependency Inversion**: Implements the interfaces defined in the Application layer.
    - **Encapsulation**: Low-level errors (like SQL errors) must be wrapped or converted to Application-level errors.

### 4. Delivery / Presentation
- **Content**: HTTP Handlers, Middleware, CLI commands.
- **Rules**:
    - **Isolation**: Should only talk to the Application layer (Use Cases).

---

## 🔗 Dependency Injection & Lifecycle

To prevent "God Files" like a bloated `dependencies.go`, we follow these standards:

### 1. Dependency Direction (DIP)
- **Prohibited**: The `internal/application` package importing `internal/infra`.
- **Solution**: The `main.go` or an `initialization` package (acting as the Composition Root) is the ONLY place allowed to link Application to Infrastructure.

### 2. Decentralized Initialization (Feature-Based)
- Avoid a single function that instantiates everything.
- Group initialization by **Feature Context**:
    ```go
    // Better:
    userModule := users.NewModule(dbPool, logger)
    userModule.RegisterRoutes(router)
    ```

### 3. The "NewX" Convention
- Every component must have a constructor function `NewComponentName(...)`.
- Pass dependencies as **interfaces**, not concrete types, to facilitate testing.

### 4. Common Dependencies (The Registry)
- For ubiquitous dependencies (Logger, Config, DB Pool), create a `Platform` or `Registry` struct to avoid passing 10+ arguments to every constructor.

---

## 🚀 Scalability Heuristics

- **Soft Limit**: If a constructor has more than 5 arguments, group related dependencies into a struct.
- **Refactoring Trigger**: If `dependencies.go` exceeds 150 lines, it MUST be decomposed into feature-based initializers.
- **Type Safety**: Prefer explicit injection over global state or "Magic" Service Locators.

---

**Last update:** 2026-01-28  
**Version:** 1.0
