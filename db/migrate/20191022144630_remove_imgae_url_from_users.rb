class RemoveImgaeUrlFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :imgae_url, :string
  end
end
