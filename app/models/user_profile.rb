class UserProfile < ActiveRecord::Base
  has_many :fields, class_name: "UserField"
  has_many :users
  accepts_nested_attributes_for :fields, allow_destroy: true
end
