class AddPasswordDigestToUtilisateur < ActiveRecord::Migration[6.1]
  def change
    add_column :utilisateurs, :password_digest, :string
  end
end
