FactoryBot.define do
  factory :entry do
    association :user
    title { "サンプルタイトル" }
    text { "これはテスト用の内容です。" }
    
    after(:build) do |entry|
      entry.image.attach(io: File.open('public/images/heart1.png'), filename: 'heart1.png')
    end

  end
end