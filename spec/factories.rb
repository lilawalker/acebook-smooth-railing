FactoryBot.define do
  factory :user do
    name { "Fake" }
    id { 1 }
    email { "fake@email.com" }
    password { "password" }
  end

  factory :post do
    message { "Fake news" }
    id { 1 }
    user_id { 40 }
    created_at { "2020-04-15 12:18:33.798988" }
  end
end
