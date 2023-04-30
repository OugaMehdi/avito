class CreateSousCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :sous_categories do |t|
      t.string :nom_sous_categorie
      t.references :categorie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
