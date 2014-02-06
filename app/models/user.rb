class User < ActiveRecord::Base
  FEED_SIZE = 10
  belongs_to :user_profile
  has_many :activities, dependent: :destroy
  has_many :details, through: :activities
  has_many :ratings, dependent: :destroy
  has_many :lists, through: :ratings, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", 
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :followed_foods, through: :relationships, source: :food
  has_many :followed_chefs, through: :relationships, source: :chef
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
  mount_uploader :image, ImageUploader
  serialize :description, Hash
    
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def main_photo
    self.image.nil ? "default_foodie.png" : self.image
  end
  
  def slug
    name.downcase.gsub(" ", "-")
  end
  
  def to_param
    "#{id}-#{slug}"
  end
  
  def tree
    Activity.from_users_followed_by(self)
  end
  
  def recent_activity
    Activity.find_all_by_user_id(self, order: 'created_at DESC',
                                       limit: FEED_SIZE)
  end
                                     
  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end
  
  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end
  
  def enthused_with?(food)
    relationships.find_by(food_id: food.id)
  end
  
  def enthuse!(food)
    relationships.create!(food_id: food.id)
  end
  
  def unenthuse!(food)
    relationships.find_by(food_id: food.id).destroy
  end
  
  def patroning?(chef)
    relationships.find_by(chef_id: chef.id)
  end
  
  def patron!(chef)
    relationships.create!(chef_id: chef.id)
  end
  
  def unpatron!(chef)
    relationships.find_by(chef_id: chef.id).destroy
  end
  
  def extolling?(culture)
    relationships.find_by(culture_id: culture.id)
  end
  
  def extol!(culture)
    relationships.create!(culture_id: culture.id)
  end
  
  def unextol!(culture)
    relationships.find_by(culture_id: culture.id).destroy
  end
  
  private
    
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end