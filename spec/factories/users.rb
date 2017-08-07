FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    name "Test User"
    email "test@example.com"
    password "qwerty"
  end
end
