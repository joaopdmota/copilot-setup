---
description: Automated code review of uncommitted changes
temperature: 0.2
---

# Code Review - Automated Change Analysis

You are performing an **automated code review** of uncommitted changes in the project.

## 🎯 Objective

Review all uncommitted changes (staged and unstaged) in the current branch, **excluding** changes in `.agent/` directory.

## 📋 Workflow Steps

### 1. Capture Changes Automatically

// turbo
Run the helper script to generate a comprehensive diff file:

```bash
bash .agent/tools/scripts/generate-diff.sh
```

This script will:
- Detect the default branch (main/master)
- Generate a diff excluding `.agent/` directory
- Save to `.agent/brain/<conversation-id>/changes.diff`
- Show a summary of changed files

### 2. Read the Generated Diff

Read the generated diff file to understand all changes:

```bash
cat .agent/brain/<conversation-id>/changes.diff
```

### 3. Perform Comprehensive Review

Analyze the changes against:

#### **Compliance with Rules**
- Check if code follows relevant `rules-tech-*.md` (React, TypeScript, Go, Clean Code)
- Verify architectural patterns are correctly applied
- Validate naming conventions and file organization

#### **Code Quality**
- Identify code duplication (DRY violations)
- Check for proper error handling
- Validate type safety and null checks
- Review function complexity and cognitive load

#### **Security & Best Practices**
- Check for security vulnerabilities (SQL injection, XSS, exposed secrets)
- Validate input validation and sanitization
- Review authentication/authorization logic
- Check for proper logging (no sensitive data)

#### **Testing**
- Verify if new code has corresponding tests
- Check if existing tests need updates
- Validate test coverage for edge cases

### 4. Generate Review Report

Create a `code_review.md` artifact with:

**Status**: ✅ Approved / ⚠️ Requires Adjustments / ❌ Rejected

**Summary**: Brief overview of changes reviewed

**Changed Files**: List of files modified with brief description

**Positive Points**: 
- What was well implemented
- Good patterns observed

**Issues Found**:
- 🔴 **Critical**: Must fix before merging (security, breaking changes)
- 🟡 **Medium**: Should fix (code quality, maintainability)
- 🟢 **Minor**: Nice to have (style, optimization)

**Recommendations**:
- Specific actionable suggestions
- Link to relevant rules/skills for reference

### 5. Update Memory (if needed)

If critical issues or new patterns are discovered:
- Update `.agent/memory.md` with lessons learned
- Document anti-patterns to avoid in future

## 🚫 What to Ignore

- Changes in `.agent/` directory (already filtered by script)
- Build artifacts and generated files
- Dependency lock files (unless suspicious changes)

## 💡 Pro Tips

- Focus on **business logic** and **user-facing changes**
- Be constructive, not just critical
- Provide code examples for suggestions when helpful
- Reference specific rules/skills that apply

---

**Version:** 1.0  
**Last update:** 2026-01-29
