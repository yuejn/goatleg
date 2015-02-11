class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :gender
      t.string :seeking_gender
      t.integer :age

      t.timestamps null: false
    end
  end
end
