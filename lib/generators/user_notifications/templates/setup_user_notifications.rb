# Creates the database table plus indexes you'll need to use Eventy
class SetupUserNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications, force: true do |t|
      t.text :body
      t.text :url
      t.datetime :time
      t.boolean :admin, default: false
      t.timestamps
    end

    create_table :user_notifications, force: true do |t|
      t.references :notification
      t.references :user
      t.datetime :read_at
    end
    add_index :user_notifications, [ :notification_id, :user_id, :read_at ], name: :index_user_notifications_on_everything
  end

  def self.down
    drop_table :notifications
    drop_table :user_notifications
  end
end
