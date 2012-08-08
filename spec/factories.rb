FactoryGirl.define do
  factory :user do
    sequence(:fullname)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    twittername "twittername" 
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end




FactoryGirl.define do
  factory :dilemma do
        dilemma "Lorem ipsum test data"
        user
      end
    end