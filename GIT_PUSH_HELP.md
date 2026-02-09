Git Push Troubleshooting Guide

This guide covers common Git push issues and how to solve them. Useful when pushing a local project to a GitHub repository.

1️⃣ Initial Setup
Commands to start:
git init
git add .
git commit -m "Initial commit"

✅ These commands initialize a repo locally and commit your files.

2️⃣ Linking Local Repo to GitHub

Add remote repository:
git remote add origin <GITHUB_REPO_URL>

Verify remote:
git remote -v

OUTPUT: 
origin  https://github.com/USERNAME/REPO_NAME.git (fetch)
origin  https://github.com/USERNAME/REPO_NAME.git (push)

3️⃣ Pushing for the First Time
git push -u origin main

Note:
Replace main with your branch name if needed (master or other)
GitHub may ask for credentials:
Username → GitHub username
Password → Personal Access Token (PAT), not your GitHub password

4️⃣ Common Git Errors & How to Fix Them

❌ Error 1: error: src refspec main does not match any

Why this happens
Your local branch is not named main
Older Git versions use master

How to check
git branch

Fix (choose ONE)
Push the existing branch:
git push origin master

OR rename your branch to main:
git branch -m master main
git push origin main

❌ Error 2: fatal: 'origin' does not appear to be a git repository

Why this happens
You did not add the remote GitHub repository

Check remote: git remote -v

Fix
git remote add origin <YOUR_GITHUB_REPO_URL>
git push origin main

❌ Error 3: fatal: Could not read from remote repository

Why this happens
Wrong repository URL
Repository does not exist
Authentication (PAT) issue

Fix step-by-step
1️⃣ Verify remote URL: git remote -v
2️⃣ Confirm: Repo exists on GitHub
             URL is correct

3️⃣ When prompted:
                  Username → your GitHub username
                  Password → Personal Access Token (PAT)

❌ Error 4: rejected - non-fast-forward

Why this happens:
GitHub repo already has commits (e.g., README)
Your local repo is behind

Fix
git pull origin main --rebase
git push origin main

❌ Error 5: error: failed to push some refs

Why this happens: 
Branch name mismatch
Remote not set correctly
Invalid or expired PAT

Fix checklist
Check branch: git branch
Check remote: git remote -v
Re-push using correct branch: git push origin main

✅ Quick Debug Checklist (Use This First)
git status
git branch
git remote -v 

5️⃣ Tips for Smooth Git Push

Always check your current branch:
git branch

Always verify remote before pushing:
git remote -v

Commit all new files:
git add .
git commit -m "Message"

Use PAT for authentication on GitHub instead of password.
For empty GitHub repo, a first push is always safe.

6️⃣ Quick Reference Command List
# Initialize local repo
git init

# Add files
git add .

# Commit files
git commit -m "Message"

# Add remote
git remote add origin <GITHUB_REPO_URL>

# Verify remote
git remote -v

# Push to GitHub
git push -u origin main

You can save this as a file:
nano GIT_PUSH_HELP.md
Paste the content and save.
Then include in your README.md:
