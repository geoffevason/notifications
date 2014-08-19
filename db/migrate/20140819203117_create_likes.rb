class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true
      t.string :likeable_type
      t.integer :likeable_id

      t.timestamps
    end
  end
end
