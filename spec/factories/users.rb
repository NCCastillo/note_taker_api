FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'top_secret'
    password_confirmation 'top_secret'
    confirmed_at { Time.now }
  end

end
