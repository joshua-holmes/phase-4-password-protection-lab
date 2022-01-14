class User < ApplicationRecord
    has_secure_password

    def authenticate(password)
        salt = password_digest[0..28]
        return false unless BCrypt::Engine::hash_secret(password, salt) == self.password_digest
        self
    end

end
