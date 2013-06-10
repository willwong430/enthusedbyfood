FactoryGirl.define do
  factory :user do
    name      "The Dude"
    email     "thedude@agreedupon.us"
    password  "foobar"
    password_confirmation "foobar"
  end
end