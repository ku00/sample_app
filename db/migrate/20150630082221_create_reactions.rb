class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.integer :from_micropost_id
      t.integer :to_micropost_id

      t.timestamps null: false
    end
    add_index :reactions, :from_micropost_id
    add_index :reactions, :to_micropost_id
    add_index :reactions, [:from_micropost_id, :to_micropost_id], unique: true
  end
end
