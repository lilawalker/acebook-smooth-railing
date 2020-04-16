FactoryBot.define do
  factory :comment do
    comment_text { "MyString" }
    user { nil }
    post { nil }
  end

  factory :user do
    name { "Fake" }
    id { 1 }
    email { "fake@email.com" }
    password { "password" }
  end

  factory :post do
    id { 1 }
    message { "This is an example post" }
    user_id { 1 }
  end
end
