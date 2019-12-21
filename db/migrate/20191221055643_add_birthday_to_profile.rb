class AddBirthdayToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :birthday, :date
  end
end
