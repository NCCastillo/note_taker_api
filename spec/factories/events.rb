FactoryGirl.define do
  factory :event do
    sequence(:name) { |n| "Ruby Conference #{n}"}
    conference "Ruby Conference"
    short_code "rubyconf"
  end
end
