class CreateAnnonces < ActiveRecord::Migration[6.1]
  def change
    create_table :annonces do |t|
      t.string :adresse
      t.boolean :masquerTel
      t.string :etat
      t.string :status
      t.string :titre
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
