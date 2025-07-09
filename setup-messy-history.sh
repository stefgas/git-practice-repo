#!/bin/bash

# Setup for Exercise 3: Interactive Rebase
echo "Creating a messy commit history to practice cleaning up..."

# Create a user feature with messy commits

# Commit 1: Add user model
cat > src/UserModel.php << 'EOF'
<?php
class UserModel {
    public $id;
    public $name;
    public $emial;
}
EOF
git add src/UserModel.php
git commit -m "Add user model"

# Commit 2: Fix typo in user model
#sed -i 's/emial/email/g' src/UserModel.php 2>/dev/null || sed -i '' 's/emial/email/g' src/UserModel.php
sed -i 's/emial/email/g' src/UserModel.php 2>/dev/null
git add src/UserModel.php
git commit -m "typo fix"

# Commit 3: Add user controller
cat > src/UserController.php << 'EOF'
<?php
class UserController {
    public function getUser($id) {
        // Get user logic here
        return new UserModel();
    }
}
EOF
git add src/UserController.php
git commit -m "Add user controller"

# Commit 4: Start user service (WIP)
cat > src/UserService.php << 'EOF'
<?php
class UserService {
    public function validateUser($user) {
        // TODO: Add validation
    }
}
EOF
git add src/UserService.php
git commit -m "WIP - user service"

# Commit 5: Finish user service
cat > src/UserService.php << 'EOF'
<?php
class UserService {
    public function validateUser($user) {
        if (empty($user->email)) {
            return false;
        }
        return filter_var($user->email, FILTER_VALIDATE_EMAIL);
    }
}
EOF
git add src/UserService.php
git commit -m "finish user service"

echo ""
echo "Messy history created! You now have 5 commits that need cleaning:"
echo ""
git log --oneline -5
echo ""
echo "Run 'git rebase -i develop' to start cleaning up this history"
