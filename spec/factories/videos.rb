FactoryGirl.define do
  factory :video do
    title { Faker::Lorem.sentence }
    image { Faker::Avatar.image }
    slug { Faker::Internet.slug }
    description { Faker::Lorem.paragraph }
    host "you_tube"
    sequence(:embed_code) { |n| "ab#{n}ki"}
  end
end
