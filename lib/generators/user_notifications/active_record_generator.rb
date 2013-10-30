require 'rails/generators'
require 'rails/generators/migration'

class UserNotifications::ActiveRecordGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def copy_migrations
    migration_template 'setup_user_notifications.rb', "db/migrate/setup_user_notifications.rb"
  end
end
