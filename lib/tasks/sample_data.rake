namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_activities
    make_relationships
  end
    
  def make_users
    admin = User.create!(name:     "Example User",
                         email:    "example@agreedupon.us",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n-1}@agreedupon.us"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
  
  def make_activities
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.activities.create!(content: content) }
    end
  end
  
  def make_relationships
    users = User.all
    user = users.first
    followed_users = users[2..50]
    followers      = users[3..40]
    followed_users.each { |followed| user.follow!(followed) }
    followers.each { |follower| follower.follow!(user) }
  end
end