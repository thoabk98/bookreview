class AddUserIdToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :user_id, :string
  end
end
