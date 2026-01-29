# Go (Golang) Development Rules

> Patterns, conventions, and best practices for Go development in the AntiGravity ecosystem.

---

## 🏗️ Project Structure

We follow the **Standard Go Project Layout**:

```
/cmd        -> Application entry points (cmd/api, cmd/worker, etc.)
/internal   -> Private application code
/pkg        -> Reusable libraries (use sparingly)
/api        -> Contracts (OpenAPI, Protobuf, AsyncAPI)
/configs    -> Configuration templates
/deploy     -> Docker, K8s, Helm, CI/CD assets
```

### Structure Guidelines

* Prefer `/internal/<app>` when multiple binaries exist.
* Use `/internal/platform` (or `/internal/infra`) for DBs, HTTP clients, messaging, caches.
* Only place code in `/pkg` if it is meant to be imported by **other repositories**.

---

## 💻 Code Patterns

### Errors

* **Check immediately**: always handle errors as soon as they occur.
* **Wrap errors**: use `fmt.Errorf("operation: detail: %w", err)`.
* **Use `errors.Is / errors.As`** for comparisons — never rely on `err == ErrX` when wrapping is possible.
* **No panic**: panic is allowed only for catastrophic startup failures.
* **Sentinel errors**: use for stable categories.

  ```go
  var ErrNotFound = errors.New("not found")
  ```
* **Typed errors**: use when context matters.

  ```go
  type ValidationError struct {
      Field string
  }

  func (e *ValidationError) Error() string {
      return "invalid field: " + e.Field
  }
  ```

---

### Naming

* **Interfaces**: `-er` suffix for single-method interfaces (`Reader`, `Closer`).
* **Variables**: `camelCase`. Short names allowed in small scopes.
* **Exported identifiers**: `PascalCase`.
* **Packages**: short, meaningful, lowercase — no plurals.

---

### Context

* Always pass `context.Context` as the **first argument**.
* Never store `context.Context` in structs.
* Always respect `ctx.Done()` in long-running operations.
* Apply **timeouts at boundaries** (HTTP, gRPC, consumers).

---

### Concurrency

* Every goroutine must have a **clear owner and termination condition**.
* Prefer `errgroup.WithContext` for fan-out/fan-in patterns.
* Channels are for **coordination**, not state.
* Only the **sender** closes a channel.
* Use `sync.Mutex` for simple shared state.

---

## 🏛️ Architecture (Clean / Hexagonal)

Layers:

1. **Domain** – Entities, Value Objects, invariants (pure Go)
2. **Usecase** – Application orchestration
3. **Repository / Adapter** – DB, cache, external APIs
4. **Delivery** – HTTP, gRPC, CLI

### Rules

* Domain must not depend on infrastructure.
* Interfaces live on the **consumer side**.
* Dependency injection via constructors (`NewX`).
* Avoid global state.

---

## 🌐 HTTP & External Clients

* Reuse `http.Client`; never create per request.
* Always configure timeouts (client or transport).
* Retries only for idempotent operations.
* Use backoff + jitter.

---

## 🔭 Observability

### Logging

* Structured logs only.
* Standard fields:

  * `trace_id`, `span_id`, `request_id`
  * `op`, `duration_ms`, `err`
* Avoid logging the same error multiple times across layers.

### Tracing & Metrics

* Every request starts a root span.
* External calls create child spans.
* Track latency and error rate per operation.

---

## 🧪 Testing

* Table-driven tests as default.
* Use `t.Run` for subtests.
* Prefer **fakes** over mocks when possible.
* Use `package_test` for black-box tests.
* Apply `t.Parallel()` only when safe.
* Use golden tests for large payloads.

---

## 🛠️ Tooling & CI

* `golangci-lint` (mandatory, version pinned).
* `go test ./...` + `-race` when applicable.
* `go vet` and `staticcheck` via linter.
* Use `Makefile` for common tasks.
* Code generation via `go generate` (Wire, mocks, sqlc).

---

## 🚀 Performance & Safety

* Pre-allocate slices when size is known.
* Use pointers for large structs or mutation.
* Avoid `init()` when possible.
* Avoid `defer` inside hot loops.
* Do not call `time.Now()` directly in domain logic — inject a clock.

---

**Last update:** 2026-01-21
**Version:** 1.1
