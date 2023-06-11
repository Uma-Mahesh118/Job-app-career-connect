class Company < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, 
                        uniqueness:{case_sensitive: false}, 
                        length: {minimum: 3, maximum:25}
    
    unless (const_defined?(:VALIDITY_CHECK_EMAIL))
        VALIDITY_CHECK_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    end

    validates :email, presence: true, 
                    uniqueness:{case_sensitive: false}, 
                    length: {maximum:105},
                    format: { with: VALIDITY_CHECK_EMAIL }
    has_secure_password
end