class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  belongs_to :food
  belongs_to :chef
  belongs_to :culture
  validates :follower_id, presence: true
  # validates :followed_id, presence: true
end
