#!/bin/bash

# Script to create a large commit with mixed changes for splitting practice

echo "Creating a large commit with mixed concerns..."

# Create multiple file changes representing different concerns

# 1. Bug fix in validation
echo "<?php
// Bug fix: Email validation
function validateEmail(\$email) {
    // FIX: Added null check
    if (\$email === null) {
        return false;
    }
    return filter_var(\$email, FILTER_VALIDATE_EMAIL);
}" > src/ValidationService.php

# 2. New feature
echo "<?php
// NEW FEATURE: User profile
class UserProfile {
    private \$bio;
    private \$avatar;
    
    public function updateBio(\$bio) {
        \$this->bio = \$bio;
    }
}" > src/UserProfile.php

# 3. Style changes
echo "<?php
// Formatting fixes
class StyleExample
{
    private \$property;
    
    public function method()
    {
        return \$this->property;
    }
}
" > src/StyleExample.php

# 4. Test additions
echo "<?php
// New tests
class ValidationTest extends TestCase {
    public function testEmailValidation() {
        \$this->assertFalse(validateEmail(null));
        \$this->assertTrue(validateEmail('test@example.com'));
    }
}" > tests/ValidationTest.php

# 5. Documentation update
echo "# API Documentation

## New Endpoints

### POST /api/user/profile
Update user profile information.

### GET /api/user/profile/{id}
Retrieve user profile." >> docs/API.md

# Stage everything (bad practice we're demonstrating)
git add -A
git commit -m "ZBDEV-1234 - Updates"

echo "
Large commit created! Now practice splitting it:

1. Use 'git reset HEAD~1' to undo the commit
2. Use 'git add -p' to stage chunks separately
3. Create atomic commits:
   - fix(validation): handle null input in email validator
   - feat(user): add UserProfile model
   - style: fix code formatting in StyleExample
   - test(validation): add email validation tests
   - docs(api): document user profile endpoints
"
