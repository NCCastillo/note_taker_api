FactoryGirl.define do
  factory :presenter do
    slug { Faker::Internet.slug }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    twitter { Faker::Internet.user_name }
  end
end
