class Utilisateur < ApplicationRecord

    has_many :annonces
    attr_accessor :current_password, :new_password, :new_password_confirmation

    validates :nom, presence: true, length: { maximum: 50 }
    VALID_EMAIL = /\A[\w+\-,]+@[a-z\d\-,]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL }
    VALID_TEL = /\A0[67]\d{8}\z/
    validates :tel, presence: true, format: { with: VALID_TEL }
    validates :ville_id, presence: true
    validates :password, presence: true, length: {minimum: 6} , if: :password_required?
    has_secure_password


    def password_required?
        !password.nil? || !password_confirmation.nil?
    end


end
