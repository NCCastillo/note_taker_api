FactoryGirl.define do
  factory :note do
    body "This is a note"
    note_taken_at { Time.now }
  end
end
