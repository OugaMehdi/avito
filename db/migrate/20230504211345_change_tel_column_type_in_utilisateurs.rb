class ChangeTelColumnTypeInUtilisateurs < ActiveRecord::Migration[6.1]
  def change
    change_column :utilisateurs, :tel, :string
  end
end
