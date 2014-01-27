class Detail < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  # validates :activity_id, presence: true
  # validates :where_at, presence: true
  
  # def details
  # end
end
