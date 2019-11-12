class User < ApplicationRecord
  paginates_per 10
  mount_uploader :avatar, MediaUploader
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  enum role: [:user, :vip, :admin]
  has_many :news_created, :class_name => 'News', foreign_key: :create_by_id
  has_many :news_updated, :class_name => 'News', foreign_key: :updated_by_id

  has_many :darkhouse_news_created, :class_name => 'DarkhouseNews', foreign_key: :create_by_id
  has_many :darkhouse_news_updated, :class_name => 'DarkhouseNews', foreign_key: :updated_by_id

  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end
  
end
