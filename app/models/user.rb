class User < ApplicationRecord
  has_secure_password

  validates :name, presence: :true 
  validates :email, format: { with: /\S+@\S+\.\S+/ },
            uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 9, allow_blank: true }
end
