class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :details
  accepts_nested_attributes_for :details, reject_if: lambda { |a| a[:where_at].blank? },
                                           allow_destroy: true
  default_scope -> { order('created_at DESC') }
  validates :title, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :content, length: { maximum: 140 }
  validates :type, length: { maximum: 140 }
  acts_as_taggable
  self.inheritance_column = nil
  
  GLOBAL_FEED_SIZE = 10

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user)
  end
  
  def self.global_feed
    find(:all,
         :joins => "INNER JOIN users u ON activities.user_id = u.id",
         :order => 'activities.created_at DESC', 
         :limit => GLOBAL_FEED_SIZE)
  end
end