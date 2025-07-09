<?php

namespace App\Controllers;

class UserController
{
    private $userService;
    
    public function __construct($userService)
    {
        $this->userService = $userService;
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
}
