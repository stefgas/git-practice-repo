<?php
// New tests
class ValidationTest extends TestCase {
    public function testEmailValidation() {
        $this->assertFalse(validateEmail(null));
        $this->assertTrue(validateEmail('test@example.com'));
    }
}
