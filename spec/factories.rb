FactoryGirl.define do
  factory :user do
    fullname     "Fence Dweller1"
    email    "admin@fencedweller.com"
    twittername "fenced"
    yob "1972"
    password "foobar"
    password_confirmation "foobar"
  end
end