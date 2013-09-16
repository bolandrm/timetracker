FactoryGirl.define do
  factory :user do
    name 'Ryan'
    sequence(:email) { |n| "email#{n}@test.com" }
    password 'pw'
  end
end
