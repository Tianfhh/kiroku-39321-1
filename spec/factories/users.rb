FactoryBot.define do
  factory :user do
    name                  {'Moon'}
    email                 {Faker::Internet.email}
    password              {'a123456'}
    password_confirmation {password}
  end
end