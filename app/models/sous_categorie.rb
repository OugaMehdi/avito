class SousCategorie < ApplicationRecord
  belongs_to :categorie
  belongs_to :annonce
end
