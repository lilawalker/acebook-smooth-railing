FactoryBot.define do
  factory :user do
    name { "Fake" }
    id { 1 }
    email { "fake@email.com" }
    password { "password" }
  end
end
