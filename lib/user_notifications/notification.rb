class Notification < ActiveRecord::Base
  has_many :user_notifications
  has_many :users, through: :user_notifications

  validates :time, presence: true
  validates :body, presence: true

  scope :admin, -> { where(admin: true) }

	def publish_to_all
		User.where('id NOT IN (SELECT un.user_id FROM user_notifications un WHERE un.notification_id = ?)', self.id).find_each do |user|
			user.notifications << self
		end
	end

  def self.create_now(options)
    self.create({time: Time.now}.merge(options))
  end
end
