# 🧠 AntiGravity Memory

> **Purpose:** Persistent context that agents should remember across conversations. This captures architectural decisions, lessons learned, and project-specific context that doesn't fit in code or rules.

---

## 🏗️ Architectural Decisions

### Decision: [Title]
**Date:** YYYY-MM-DD  
**Context:** Why this decision was needed  
**Decision:** What was decided  
**Rationale:** Why this approach was chosen  
**Consequences:** Trade-offs and implications

**Example:**
```markdown
### Decision: Feature-Based Architecture
**Date:** 2026-01-29
**Context:** Project was growing and files were hard to locate
**Decision:** Adopted vertical slice architecture
**Rationale:** High cohesion, easy to remove features, clear boundaries
**Consequences:** Requires discipline to avoid cross-feature dependencies
```

---

## 🛠️ Tech Stack

### Primary Technologies
- **Frontend:** [e.g., Next.js 15, React 19]
- **Backend:** [e.g., Supabase, Go APIs]
- **Database:** [e.g., PostgreSQL]
- **State Management:** [e.g., Zustand, TanStack Query]
- **Styling:** [e.g., Vanilla CSS with HSL]

### Why These Choices?
- **[Technology]:** [Reason for choosing it over alternatives]

---

## 🎯 Business Domain Context

### What This Product Does
[Brief description of the product/service]

### Key Domain Concepts
- **[Concept]:** [Definition and importance]

---

## 🚨 Lessons Learned

### Mistake: [Title]
**Date:** YYYY-MM-DD  
**What Happened:** Description of the error  
**Root Cause:** Why it happened  
**Solution:** How it was fixed  
**Prevention:** How to avoid it in the future

**Example:**
```markdown
### Mistake: Forgot 'use client' Directive
**Date:** 2026-01-15
**What Happened:** Component using useState crashed with hydration error
**Root Cause:** Next.js 15 defaults to Server Components
**Solution:** Added 'use client' at the top of the file
**Prevention:** Always check if component uses hooks/browser APIs
```

---

## 🔄 Refactoring Insights

### Refactoring: [Title]
**Date:** YYYY-MM-DD  
**Original Approach:** What was done initially  
**Problem:** Why it didn't work  
**New Approach:** How it was improved  
**Impact:** Measurable improvements

---

## ⚠️ Anti-Patterns Discovered

### Anti-Pattern: [Title]
**Description:** What it looks like  
**Why It's Bad:** Consequences  
**Better Alternative:** Recommended approach

---

## 🎯 Performance Learnings

### Learning: [Title]
**Issue:** Performance problem  
**Diagnosis:** How identified  
**Fix:** What was done  
**Metrics:** Before/after measurements

---

## 🔐 Security Incidents

### Incident: [Title]
**Date:** YYYY-MM-DD  
**What Happened:** Security issue  
**Severity:** [Low/Medium/High/Critical]  
**Resolution:** How fixed  
**Prevention:** Measures to prevent recurrence

---

## 📚 Third-Party Library Experiences

### Library: [Name]
**Tried For:** What problem it solved  
**Experience:** What worked/didn't  
**Verdict:** Keep/Replace/Avoid  
**Alternative:** If replaced, what was used

---

## 👥 Team Preferences

- **Code Comments:** [Language preference, when to comment]
- **Testing Philosophy:** [What gets tested, coverage goals]
- **Deployment Strategy:** [How and when to deploy]
- **Communication:** [Documentation standards]
