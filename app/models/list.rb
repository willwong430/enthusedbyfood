class List < ActiveRecord::Base
  belongs_to :rating
  validates :content, presence: true
end
