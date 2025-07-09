#!/bin/bash

# Setup for Exercise 2: Creating Atomic Commits

echo "Setting up Exercise 2 files..."

# Modify UserController.php with mixed changes
cat >> src/UserController.php << 'EOF'

    // BUG FIX: Add missing validation
    private function validateUserData($data)
    {
        if (empty($data['name']) || empty($data['email'])) {
            throw new \Exception('Name and email are required');
        }
        return true;
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
EOF

# Add refactoring to UserService.php
sed -i.bak 's/strtolower/mb_strtolower/g' src/UserService.php

# Add new tests to UserTest.php
cat >> tests/UserTest.php << 'EOF'

    public function testUserValidation()
    {
        // Test for validation logic
        $this->expectException(\Exception::class);
        // Test implementation here
    }

    public function testBulkImport()
    {
        // Test for bulk import feature
        $this->assertTrue(true);
    }
EOF

# Update README with minor change
echo "" >> README.md
echo "Last updated: $(date)" >> README.md

echo "Exercise 2 files prepared!"
echo "Run 'git status' to see all changes"
