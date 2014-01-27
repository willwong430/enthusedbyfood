FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password  "foobar"
    password_confirmation "foobar"
  
    factory :admin do
      admin true
    end
  end
  
  factory :activity do
    content "Lorem ipsum"
    user
  end
  
  factory :detail do
    who "The Dude"
    what "White Russians"
    where "California"
    why "the dude abides"
    how "10"
    activity
  end 
end