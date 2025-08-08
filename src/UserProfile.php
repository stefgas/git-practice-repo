<?php
// NEW FEATURE: User profile
class UserProfile {
    private $bio;
    private $avatar;
    
    public function updateBio($bio) {
        $this->bio = $bio;
    }
}
