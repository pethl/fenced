namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    admin = User.create!(fullname: "Fenced Admin",
                             email: "superadmin@fencedweller.com",
                             password: "foobar",
                             password_confirmation: "foobar")
        admin.toggle!(:admin)
    
    
    
    
    User.create!(fullname: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      fullname  = Faker::Name.name
      email = "example-#{n+1}@company.com"
      password  = "password"
      User.create!(fullname: fullname,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end