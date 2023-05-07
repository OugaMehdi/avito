class CreateVilles < ActiveRecord::Migration[6.1]
  def change
    create_table :villes do |t|
      t.string :nom_ville

      t.timestamps
    end
  end
end
