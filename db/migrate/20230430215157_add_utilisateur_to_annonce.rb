class AddUtilisateurToAnnonce < ActiveRecord::Migration[6.1]
  def change
    add_reference :annonces, :utilisateur, null: false, foreign_key: true
  end
end
