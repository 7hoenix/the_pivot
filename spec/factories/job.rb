FactoryGirl.define do
  sequence :job do |n|
    business_id n
    title "Jr dev"
    description "Write some code"
    benefits "100 dollars"
    address_id (n + 5)
  end
end
