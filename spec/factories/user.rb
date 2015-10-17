FactoryGirl.define do
  factory :user do
    uid "234082342"
    email "some@dude.com"
    full_name "some dude"
    nickname "hi"
    provider "gitub"
    token "092ofa09jfokasjdf0ij32hf"
    image_url "I-am-an-image-url"
  end

  factory :admin do
    uid "99999999999"
    email "admin@admin.com"
    full_name "Mr Admin"
    nickname "Admin"
    provider "gitub"
    token "092ofa09jfokasjdf0ij32hf"
    image_url "I-am-an-image-url"
    role 4
  end
end
