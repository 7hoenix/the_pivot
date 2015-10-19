FactoryGirl.define do
  factory :business do
    name Faker::Company.name
    about Faker::Company.catch_phrase
  end
end
