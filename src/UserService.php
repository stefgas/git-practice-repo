<?php

namespace App\Services;

class UserService
{
    private $database;
    
    public function __construct($database)
    {
        $this->database = $database;
    }
    
    // This method needs refactoring - too complex
    public function create($data)
    {
        // Intentionally messy code for refactoring practice
        $user = [];
        $user['name'] = $data['name'];
        $user['email'] = $data['email'];
        $user['created_at'] = date('Y-m-d H:i:s');
        
        // Poor practice: direct DB access
        $sql = "INSERT INTO users (name, email, created_at) VALUES (?, ?, ?)";
        // ... database logic ...
        
        // Duplicate code that should be extracted
        if ($user['email']) {
            $user['email'] = strtolower($user['email']);
        }
        
        return $user;
    }
    
    public function findById($id)
    {
        // Simple implementation
        return $this->database->find('users', $id);
    }
    
    public function update($id, $data)
    {
        // Another method that needs improvement
        $user = $this->findById($id);
        
        // More duplicate code
        if ($data['email']) {
            $data['email'] = strtolower($data['email']);
        }
        
        return $this->database->update('users', $id, $data);
    }
}
