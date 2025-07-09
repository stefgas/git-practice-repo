# Git Best Practices - Hands-on Exercise Worksheet

## Pre-Exercise Setup
```bash
# Clone the practice repository
git clone https://github.com/stefgas/git-practice-repo.git
cd git-practice-repo

# Each exercise will remind you to create a new practice branch
```

---

## Exercise 1: Writing Conventional Commits (10 minutes)

### Task: Convert these commit messages to conventional format

1. Original: "Added user validation to controller"
   Your answer: ________________________________

2. Original: "Fixed null pointer exception in user service"
   Your answer: ________________________________

3. Original: "Updated documentation for API endpoints"
   Your answer: ________________________________

4. Original: "Upgraded phpunit from 9 to 10"
   Your answer: ________________________________

5. Original: "Removed deprecated authentication method"
   Your answer: ________________________________

### Practice: Make real commits
```bash
# Create a new file
echo "# Practice File" >> practice.md
git add practice.md
git commit -m "[Write your conventional commit here]"
```

---

## Exercise 2: Creating Atomic Commits (15 minutes)

**Setup: Create your practice branch**
```bash
git checkout develop
git checkout -b practice2/[your-name]
```

### Scenario: You've made multiple changes in multiple files

Run setup-exercise2.sh to prepare the changes
```bash
./setup-exercise2.sh
```

### Task: Stage and commit these changes atomically

```bash
# 1. Check what's changed
git status
git diff

# 2. Stage the bug fix only
git add -p src/UserController.php
# Select only the bug fix hunks

# 3. Commit the bug fix
git commit -m "_______________"

# 4. Continue with other logical changes...
# Your commands:
# _______________
# _______________
# _______________
```

### Verification:
```bash
# Check your commit history
git log --oneline -5

# Each commit should have ONE logical change
```

---

## Exercise 3: Interactive Rebase (15 minutes)

**Setup: Create your practice branch**
```bash
git checkout develop
git checkout -b practice3/[your-name]
```

### Setup: Create a messy history
Run the following to create a messy history of commits on your practice branch:
```bash
./setup-messy-history.sh
```

This will create a commit history that looks like (oldest first):
```
1. Add user model
2. typo fix
3. Add user controller
4. WIP - user service
5. finish user service
```

### Task 1: View your messy history
```bash
# See what commits need cleaning
git log --oneline -5
```

### Task 2: Start interactive rebase to clean up these 5 commits
```bash
# Start interactive rebase for the last 5 commits
git rebase -i develop
```

### Task 3: In the rebase editor, plan your changes
You'll see commits listed oldest to newest. Your goal is to combine related commits:

```
# Change this:
pick abc1234 Add user model
pick def5678 typo fix
pick ghi9012 Add user controller  
pick jkl3456 WIP - user service
pick mno7890 finish user service

# To this:
pick abc1234 Add user model
squash def5678 typo fix
pick ghi9012 Add user controller
pick jkl3456 WIP - user service
squash mno7890 finish user service
```

### Task 4: Save and write proper commit messages
When prompted:
1. First squash: Keep "Add user model" and delete the "typo fix" line
2. Second squash: Write a proper message like "feat(user): add user service with validation"

### Verification:
```bash
# Check your cleaned history
git log --oneline -3

# You should now have 3 clean commits:
# - feat(user): add user service with validation
# - Add user controller
# - Add user model
```

---

## Exercise 4: Splitting Large Commits (15 minutes)

**Setup: Create your practice branch**
```bash
git checkout develop
git checkout -b practice4/[your-name]
```

### Setup: Create a large commit with too many concerns
Run the following to create a large commit we will then break up
```bash
./large-commit-simulator.sh
```

### Task 1: Splitting Large Commits

```bash
# Reset mixed changes
git reset HEAD~1

# Stage and commit separately using interactive staging
git add -p  # Interactive staging
# Stage only validation fixes
git commit -m "fix(validation): Correct email regex pattern"

git add -p
# Stage only test additions
git commit -m "test(validation): Add test cases for email validation"
```

### Task 2: Continue splitting the remaining changes
```bash
# Stage and commit any remaining changes
git add -p
# Stage only documentation updates
git commit -m "docs(validation): Update API documentation"
```

---

## Exercise 5: Commit Message Workshop (15 minutes)

### Group Exercise: Review and improve these commits

Work with a partner to review this commit history and suggest improvements:

```
8f7a6b5 Added email validation to registration form
7c5d4e3 Fixed crash when user profile is empty
6b4c3d2 Updated React from version 17 to 18
5a3b2c1 Cleaned up unused imports in UserService
d3f09a2 Added unit tests for payment processing
4z2a1b0 refactor: improved UserService performance by optimizing database queries and caching
```

### Your improved versions:
1. _______________
2. _______________
3. _______________
4. _______________
5. _______________

---

## Exercise 6: Real-world Scenario (10 minutes)

### Scenario: 
You've been working on a feature branch for 3 days. You have:
- 15 commits (including "WIP" and "fix typo" commits)
- Your branch is 10 commits behind develop
- You need to prepare for PR review

### Task: List your git commands in order
1. _______________
2. _______________
3. _______________
4. _______________
5. _______________

---

## Self-Assessment Checklist

After completing these exercises, can you:

- [ ] Write conventional commit messages
- [ ] Create atomic commits
- [ ] Use interactive rebase to clean history
- [ ] Split large commits into atomic pieces
- [ ] Prepare clean PRs for review

## Notes Section
_Use this space for questions or concepts to review:_

_______________________________________________
_______________________________________________
_______________________________________________
_______________________________________________
