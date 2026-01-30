# Memory Management Rules

> **Purpose:** Ensure the AntiGravity system continuously learns from experience by maintaining an up-to-date memory.

---

## 📖 Reading Memory

**MANDATORY:** Before starting any significant task (planning, implementation, or review), you MUST read `.github/memory.md` to understand:

- Past architectural decisions and their rationale
- Known mistakes and how to prevent them
- Project-specific context and preferences

**When to read:**

- At the start of `/planner` workflow
- Before implementing a new feature
- During `/reviewer` audits

---

## ✍️ Writing to Memory

**MANDATORY:** Update `.github/memory.md` when:

### 1. Critical Mistakes Occur

If you make an error that:

- Violates a rule you should have known
- Causes a bug or security issue
- Requires significant rework

**Action:** Add entry to "Lessons Learned" section with:

- What happened
- Root cause
- Prevention strategy

### 2. Architectural Decisions Are Made

When the user approves a significant technical decision:

- New technology adoption
- Architecture pattern change
- Major refactoring approach

**Action:** Add entry to "Architectural Decisions" section.

### 3. Anti-Patterns Are Discovered

During code review, if you identify a recurring bad pattern:

**Action:** Document in "Anti-Patterns Discovered" section.

### 4. Performance Issues Are Resolved

After fixing a performance bottleneck:

**Action:** Add to "Performance Learnings" with before/after metrics.

---

## 🔄 Memory Update Workflow

When updating memory:

1. **Read current memory** to avoid duplicates
2. **Add new entry** in the appropriate section
3. **Keep it concise** - focus on actionable insights
4. **Include dates** for temporal context
5. **Notify user** of the memory update

---

## 🚫 What NOT to Put in Memory

- Routine code changes (use git history)
- Temporary decisions (use comments)
- Implementation details (use documentation)
- Personal opinions without rationale

---

## 💡 Pro Tips

- **Be specific:** "Forgot 'use client' in interactive components" > "Made a React mistake"
- **Be actionable:** Always include a "Prevention" or "Better Alternative"
- **Be honest:** Document failures to prevent recurrence
- **Be concise:** One paragraph per entry maximum

---

## 🎯 Success Metric

The memory is working when:

- You stop making the same mistake twice
- New agents can understand project context quickly
- Architectural decisions have clear rationale
- The system becomes more autonomous over time
