class Commande < ApplicationRecord
  belongs_to :utilisateur
  belongs_to :annonce
end
