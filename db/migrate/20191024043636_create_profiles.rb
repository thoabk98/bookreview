class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :bio
      t.string :avatar
      t.string :sex

      t.timestamps
    end
  end
end
