class Annonce < ApplicationRecord
    has_one_attached :photo
    belongs_to :utilisateur
    belongs_to :sous_categorie

    has_many :favoris
end
