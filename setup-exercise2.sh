#!/bin/bash

# Setup for Exercise 2: Creating Atomic Commits

echo "Setting up Exercise 2 files..."

# Modify UserController.php with mixed changes
cat > src/UserController.php << 'EOF'
<?php

namespace App\Controllers;

class UserController
{
    private $userService;
    
    public function __construct($userService)
    {
        $this->userService = $userService;
    }

        // BUG FIX: Add missing validation
    private function validateUserData($data)
    {
        if (empty($data['name']) || empty($data['email'])) {
            throw new \Exception('Name and email are required');
        }
        return true;
    }
    
    // BUG: This method doesn't validate input
    public function createUser($data)
    {
        // Missing validation here
        $user = $this->userService->create($data);
        return $user;
    }
    
    // NEW FEATURE: Add user search functionality
    public function searchUsers($query)
    {
        // TODO: Implement search logic
        $results = [];
        // This is a new feature that needs implementation
        return $results;
    }
    
    public function getUser($id)
    {
        return $this->userService->findById($id);
    }
    
    // Another method with intentional issues for practice
    public function updateUser($id, $data)
    {
        // BUG: No authorization check
        $user = $this->userService->update($id, $data);
        return $user;
    }

    // NEW FEATURE: Bulk user import
    public function bulkImport($users)
    {
        $imported = [];
        foreach ($users as $userData) {
            $imported[] = $this->createUser($userData);
        }
        return $imported;
    }
}
EOF

# Add refactoring to UserService.php
sed -i.bak 's/strtolower/mb_strtolower/g' src/UserService.php

# Add new tests to UserTest.php
cat > tests/UserTest.php << 'EOF'
<?php

namespace Tests;

use PHPUnit\Framework\TestCase;

class UserTest extends TestCase
{
    public function testUserValidation()
    {
        // Test for validation logic
        $this->expectException(\Exception::class);
        // Test implementation here
    }

    // Existing test
    public function testUserCreation()
    {
        // Basic test implementation
        $this->assertTrue(true);
    }
    
    public function testBulkImport()
    {
        // Test for bulk import feature
        $this->assertTrue(true);
    }

    // New tests need to be added for:
    // - User validation
    // - Search functionality
    // - Authorization checks
    // - Email normalization
}
EOF

# Update README with minor change
echo "" >> README.md
echo "Last updated: $(date)" >> README.md

echo "Exercise 2 files prepared!"
echo "Run 'git status' to see all changes"
