FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    factory :invalid_user do
      username nil
      email { "murokwuz.com" }
      password nil
    end
  end
end
