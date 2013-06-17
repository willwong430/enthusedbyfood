FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "The Dude#{n}" }
    sequence(:email) { |n| "thedude_#{n}@agreedupon.us"}
    password  "foobar"
    password_confirmation "foobar"
  
    factory :admin do
      admin true
    end
  end
end