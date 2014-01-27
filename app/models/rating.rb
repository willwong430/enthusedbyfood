class Rating < ActiveRecord::Base
  has_many :lists
  accepts_nested_attributes_for :lists, allow_destroy: true
  belongs_to :user
end
