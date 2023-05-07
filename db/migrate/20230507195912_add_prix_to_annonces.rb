class AddPrixToAnnonces < ActiveRecord::Migration[6.1]
  def change
    add_column :annonces, :prix, :int
  end
end
