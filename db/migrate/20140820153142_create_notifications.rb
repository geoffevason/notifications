class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true
      t.references :source_user, index: true
      t.references :source_object,  polymorphic: true, index: true
      t.boolean :read, default: false
      t.boolean :processed, default: false
      t.string :notification_type

      t.timestamps
    end

    create_table :notification_preferences do |t|
      t.references :user, index: true
      t.string :notification_type

      t.boolean :send_email, default: false

      t.timestamps
    end
  end
end
