FactoryBot.define do
  factory :user do
    name                  {'Moon'}
    email                 {'hl021501@yahoo.co.jp'}
    password              {'a123456'}
    password_confirmation {password}
  end
end