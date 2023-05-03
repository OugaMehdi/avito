class Utilisateur < ApplicationRecord
    validates :nom, presence: true, length: { maximum: 50 }
    VALID_EMAIL = /\A[\w+\-,]+@[a-z\d\-,]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL }
    validates :tel, presence: true
    validates :ville_id, presence: true
    validates :password, presence: true, length: {minimum: 6} 
    has_secure_password
end
