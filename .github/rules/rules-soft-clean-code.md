# 🧹 Clean Code Master Rules

> Comprehensive guidelines based on Robert C. Martin's "Clean Code", adapted for the AntiGravity ecosystem.
> **🌍 Universal Applicability:** These rules are **language-agnostic**. Whether you are writing TypeScript, Golang, Python, or Rust, these principles remain the immutable foundation of quality software.

> "Even bad code can function. But if code isn't clean, it can bring a development organization to its knees."

---

## 📉 Chapter 1: The Cost of Mess

-   **LeBlanc's Law**: *Later equals never*. Don't say "I'll clean it up later". You won't.
-   **Velocity vs. Speed**: Messy code might feel faster locally, but it kills the project's velocity long-term.
-   **The Professional Attitude**: It is unprofessional to ship messy code to meet a deadline, just as it is unprofessional for a doctor to skip hand-washing to save time.

---

## 🏷️ Chapter 2: Meaningful Names

-   **Intention-Revealing**: The name should answer why it exists, what it does, and how it is used.
    -   ❌ `const d; // elapsed time in days`
    -   ✅ `const elapsedTimeInDays;`
-   **Avoid Disinformation**: Do not refer to a grouping of accounts as an `accountList` unless it's actually a `List`. Use `accountGroup` or just `accounts`.
-   **Make Meaningful Distinctions**: Avoid noise words like `Info`, `Data`, `Manager` if they don't add specific meaning.
    -   ❌ `getProductData()` vs `getProduct()` (Redundant)
-   **Pronounceable Names**: If you can't say it, you can't discuss it.
    -   ❌ `genymdhms` (generation date, year, month, day, hour, minute, second)
    -   ✅ `generationTimestamp`
-   **Searchable Names**: Single-letter names (`i`, `e`) are strictly for local loop scope.
    -   ❌ `if (s > 54)`
    -   ✅ `const MAX_BLOCKS = 54; if (status > MAX_BLOCKS)`

---

## 🧩 Chapter 3: Functions

-   **Small!**: The first rule is that they should be small. The second rule is that **they should be smaller than that**. (Aim for < 20 lines).
-   **Do One Thing (SRP)**: Functions should do one thing. They should do it well. They should do it only.
-   **One Level of Abstraction**: Don't mix low-level URL building with high-level HTML rendering in the same function.
-   **Switch Statements**: Buried as deep as possible. Ideally inside a Factory pattern. Never let them spread across the system.
-   **Descriptive Names**: Don't be afraid of long names. `fetchUserAndValidatePermissions` is better than `check`.
-   **Function Arguments**:
    -   **0 arguments (Niladic)**: Best case.
    -   **1 argument (Monadic)**: Very Common.
    -   **2 arguments (Dyadic)**: Acceptable.
    -   **3+ arguments (Polyadic)**: **Avoid**. Wrap in an object/interface.
    -   **Flag Arguments**: Passing a boolean is awful. It loudly declares the function does more than one thing. Split it.
-   **No Side Effects**: Your function promises to do one thing, but it also does other hidden things (like mutating state). **Don't lie.**

---

## 📝 Chapter 4: Comments

-   **"Comments Do Not Make Up for Bad Code"**: If you feel the need to write a comment/explanation, rewrite the code to be expressive.
-   **Good Comments**: Legal info, Informative comments (`// returns matches`), Warning of consequences (`// takes a long time`), TODOs.
-   **Bad Comments**: Mumbling, Redundant (`i++ // increments i`), Misleading, Commented-out code (**Delete it immediately; git history saves you**).

---

## 📐 Chapter 5: Formatting

-   **The Newspaper Metaphor**: High-level concepts at top, details at bottom.
-   **Vertical Openness**: Separate concepts with blank lines.
-   **Vertical Density**: Related lines of code should be properly dense.
-   **Team Rules**: The team's style (prettier/eslint) rules prevail over personal preference. **Consistency is King**.

---

## 🧱 Chapter 6: Objects and Data Structures

-   **Data Abstraction**: Hiding implementation is not just about putting a layer of functions between the variables. It's about **exposing abstract interfaces** that allow users to manipulate the essence of the data, without knowing its implementation.
-   **Data/Object Anti-Symmetry**:
    -   **Objects**: Hide their data behind abstractions and expose functions that operate on that data.
    -   **Data Structures**: Expose their data and have no meaningful functions.
-   **The Law of Demeter**: A module should not know about the innards of the objects it manipulates. `ctxt.getOptions().getScratchDir().getAbsolutePath()` is a violation (Train Wreck).

---

## 🛡️ Chapter 7: Error Handling

-   **Use Exceptions (Try/Catch) Rather Than Return Codes**: Keeps the calling code clean.
-   **Write Try-Catch-Finally First**: Define the scope of your code.
-   **Don't Return Null**: You are creating work for your caller. Return an empty array/object or throw.
-   **Don't Pass Null**: Worse than returning null. Unless you are calling a API that forces you to use null, forbid it.

---

## 🚧 Chapter 8: Boundaries

-   **Using Third-Party Code**: encapsulate it. Don't pass `Map` or other interface-heavy objects around your system. Wrap them in your own class/interface (Adapter Pattern).
-   **Learning Tests**: Write tests to explore and understand third-party APIs.

---

## 🧪 Chapter 9: Unit Tests

-   **The Three Laws of TDD**:
    1.  You may not write production code until you have written a failing unit test.
    2.  You may not write more of a unit test than is sufficient to fail.
    3.  You may not write more production code than is sufficient to pass the currently failing test.
-   **Keep Tests Clean**: "Test code is just as important as production code."
-   **F.I.R.S.T.**:
    -   **Fast**: Tests should run quickly.
    -   **Independent**: Tests should not depend on each other.
    -   **Repeatable**: Should run in any environment (production, train, laptop).
    -   **Self-Validating**: Boolean output. Pass or Fail.
    -   **Timely**: Written *just before* the production code.

---

## 🏛️ Chapter 10: Classes

-   **Organization**: Public static constants -> Private static variables -> Private instance variables -> Public functions -> Private utilities.
-   **Classes Should Be Small**: Measured by **responsibilities** (SRP).
-   **Cohesion**: A class should have a small number of instance variables. Each method of a class should manipulate one or more of those variables. If cohesion is low, split the class.

---

## 👃 Smells and Heuristics (Selected)

-   **G5: Duplication**: The root of all evil.
-   **G6: Code at Wrong Level of Abstraction**: Constants/Functions should be placed closest to where they are conceptually meaningful.
-   **G9: Dead Code**: Delete it.
-   **G28: Encapsulate Conditionals**: `if (shouldBeDeleted(timer))` is better than `if (timer.hasExpired() && !timer.isRecurrent())`.
-   **N1: Choose Descriptive Names**: Names should imply the behavior.
-   **N2: Choose Names at Appropriate Level of Abstraction**.

---

**Last update:** 2026-01-27
**Reference:** *Clean Code: A Handbook of Agile Software Craftsmanship* by Robert C. Martin
