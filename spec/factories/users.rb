FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    factory :invalid_user do
      name nil
      username nil
      email nil
      password nil
    end
  end
end
