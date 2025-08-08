<?php
// Bug fix: Email validation
function validateEmail($email) {
    // FIX: Added null check
    if ($email === null) {
        return false;
    }
    return filter_var($email, FILTER_VALIDATE_EMAIL);
}
