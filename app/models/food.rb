class Food < ActiveRecord::Base
  belongs_to :product_type
  has_many :reverse_relationships, foreign_key: "food_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  validates :name, uniqueness: { case_sensitive: false }
  serialize :content, Hash
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}")
    else
      all
    end
  end
  
  def slug
    name.downcase.gsub(" ", "-")
  end

  def to_param
    "#{slug}"
  end
  
  def main_image
    self.image.nil? ? "default_food.png" : self.image
  end
end