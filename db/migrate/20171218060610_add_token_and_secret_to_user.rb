class AddTokenAndSecretToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :token, :string, after: :name
    add_column :users, :secret, :string, after: :token
  end
end
