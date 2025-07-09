<?php
class ValidationTest extends TestCase {
    public function testEmailValidation() {
        $this->assertTrue(validateEmail('test@example.com'));
    }
}
