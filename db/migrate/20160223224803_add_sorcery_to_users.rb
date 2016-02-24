class AddSorceryToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :password_digest, :crypted_password
    add_column :users, :salt, :string
  end
end
