class AddVilleToUtilisateur < ActiveRecord::Migration[6.1]
  def change
    add_reference :utilisateurs, :ville, null: false, foreign_key: true
  end
end
