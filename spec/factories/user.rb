FactoryGirl.define do
  factory :user do
    name = Faker::Name.name
    uid "12345"
    full_name name
    email Faker::Internet.email(name)
    nickname Faker::Internet.user_name(name)
    provider "github"
    token Faker::Code.ean
    image_url "I-am-an-image-url"
  end

  factory :admin do
    name = Faker::Name.name
    uid Faker::Code.ean
    full_name name
    email Faker::Internet.email(name)
    nickname Faker::Internet.user_name(name)
    provider "github"
    token Faker::Code.ean
    image_url "I-am-an-image-url"
    role 4
  end

end
