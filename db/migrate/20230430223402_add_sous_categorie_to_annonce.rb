class AddSousCategorieToAnnonce < ActiveRecord::Migration[6.1]
  def change
    add_reference :annonces, :sous_categorie, null: false, foreign_key: true
  end
end
