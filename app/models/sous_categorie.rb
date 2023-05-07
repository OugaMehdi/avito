class SousCategorie < ApplicationRecord
  belongs_to :categorie
  has_many :annonce
end
