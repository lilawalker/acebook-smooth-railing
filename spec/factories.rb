FactoryBot.define do
  factory :comment do
    comment_text { "MyString" }
    user { nil }
    post { nil }
  end

  factory :user do

    trait :fake do
      name { "Fake" }
      id { 1 }
      email { "fake@email.com" }
      password { "password" }
    end

    trait :john do
      name { "John Doe" }
      id { 2 }
      email { "john@email.com" }
      password { "password" }
    end

  end

  factory :post do
    message { "Fake news" }
    id { 1 }
    user_id { 1 }
    created_at { "2020-04-15 12:18:33.798988" }
  end
end
