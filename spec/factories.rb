FactoryGirl.define do
  
  factory :user do
    sequence(:fullname)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"
    
  factory :admin do
          admin true
        end
        
        
  factory :dilemma do
      dilemma "Lorem ipsum test data"
      status "Open"
      title "1"
      ans_opt "1"
      user
    end    
  end
end