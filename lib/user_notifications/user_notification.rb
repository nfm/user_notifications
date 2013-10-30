class UserNotification < ActiveRecord::Base
	belongs_to :user
	belongs_to :notification
  scope :unread, -> { where(read_at: nil) }
  scope :read, -> { where('read_at IS NOT NULL') }
end
