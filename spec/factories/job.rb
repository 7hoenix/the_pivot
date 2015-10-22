FactoryGirl.define do
  factory :job do
    title Faker::Name.title
    description Faker::Lorem.paragraphs(Random.rand(1..2)).join('\n')
    benefits Faker::Lorem.paragraphs(1).join('\n')
    address
    business
  end
end
