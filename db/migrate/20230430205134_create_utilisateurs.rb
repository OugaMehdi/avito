class CreateUtilisateurs < ActiveRecord::Migration[6.1]
  def change
    create_table :utilisateurs do |t|
      t.string :nom
      t.string :email
      t.integer :tel

      t.timestamps
    end
  end
end
