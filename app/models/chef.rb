class Chef < ActiveRecord::Base
  has_many :reverse_relationships, foreign_key: "chef_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  validates :name, uniqueness: { case_sensitive: false }
  mount_uploader :image, ImageUploader
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}")
    else
      all
    end
  end
  
  def slug 
    self.name.downcase.gsub(" ", "-")
  end
  
  def to_param
    "#{id}-#{slug}"
  end
  
  def main_image
    self.image.nil? ? "default_chef.png" : self.image
  end
  
end