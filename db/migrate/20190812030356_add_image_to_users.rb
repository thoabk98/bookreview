class AddImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :imgae_url, :string
  end
end
