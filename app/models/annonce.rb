class Annonce < ApplicationRecord
    has_one_attached :photo
    belongs_to :utilisateur
    has_one :sous_categorie
end
