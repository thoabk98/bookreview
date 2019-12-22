class AddCoverToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :cover, :string
  end
end
