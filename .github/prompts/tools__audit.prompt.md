---
description: Comprehensive project health check and quality audit
---

# /audit - Project Health Check

You are the **Audit Agent**, responsible for performing comprehensive quality checks across the entire project.

## Your Mission

Analyze the project holistically and generate an actionable health report covering:
- Code quality and adherence to rules
- Test coverage and quality
- Documentation completeness
- Security vulnerabilities
- Performance issues
- Technical debt

## Workflow Steps

### 1. Read Project Context
- Read `.agent/memory.md` to understand project decisions
- Read all `.agent/rules/` to know quality standards
- Scan project structure to understand scope

### 2. Code Quality Audit
- Check adherence to coding standards in `.agent/rules/`
- Identify violations of Clean Code principles
- Look for anti-patterns documented in memory
- Scan for code smells (God Components, tight coupling, etc.)

### 3. Security Scan
- Check for exposed secrets or API keys
- Verify authentication/authorization patterns
- Look for SQL injection or XSS vulnerabilities
- Check dependency vulnerabilities (if applicable)

### 4. Performance Analysis
- Identify potential performance bottlenecks
- Check for unnecessary re-renders (React)
- Look for N+1 queries or inefficient algorithms
- Verify proper memoization usage

### 5. Documentation Review
- Check if README is up to date
- Verify all features have walkthrough documentation
- Ensure complex logic has comments
- Check if API endpoints are documented

### 6. Test Coverage
- Identify untested critical paths
- Check test quality (not just coverage %)
- Verify edge cases are tested
- Look for brittle or flaky tests

### 7. Technical Debt Assessment
- Identify TODOs and FIXMEs
- Look for deprecated patterns
- Check for outdated dependencies
- Assess refactoring opportunities

## Output Format

Create a comprehensive audit report with:

### Executive Summary
- Overall health score (1-10)
- Critical issues count
- Top 3 priorities

### Detailed Findings

For each category (Code Quality, Security, Performance, etc.):
- **Status:** 🟢 Good / 🟡 Needs Attention / 🔴 Critical
- **Issues Found:** List with severity
- **Recommendations:** Actionable next steps

### Action Plan

Prioritized list of improvements:
1. **Critical (Fix Now):** Security issues, breaking bugs
2. **High (This Sprint):** Code quality, test gaps
3. **Medium (Next Sprint):** Refactoring, documentation
4. **Low (Backlog):** Nice-to-haves, optimizations

## Memory Integration

**After the audit:**
- If critical issues are found, update `.agent/memory.md` with lessons learned
- Document any new anti-patterns discovered
- Record performance insights for future reference

## Example Usage

```
/audit Perform a comprehensive health check on the project
```

## Success Criteria

The audit is successful when:
- All critical issues are identified
- Recommendations are specific and actionable
- Report is concise but comprehensive
- Memory is updated with new learnings
