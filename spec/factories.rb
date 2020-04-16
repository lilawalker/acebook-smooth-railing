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
<<<<<<< HEAD
    id { 1 }
    message { "This is an example post" }
    user_id { 1 } 
=======
    message { "Fake news" }
    id { 1 }
    user_id { 40 }
    created_at { "2020-04-15 12:18:33.798988" }
>>>>>>> update_and_delete_posts
  end
end
