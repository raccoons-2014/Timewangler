FactoryGirl.define do
  factory :user do
    username { "test_user" }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    # factory :invalid_user do
    #   username nil
    #   email { "murokwuzhere.com" }
    #   password nil
    # end
  end
end
