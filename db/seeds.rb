require "faker"

def gen_address
  Address.new(
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
  )
end

def random_job_status
  chance = Random.rand(100)
  if chance > 75
    "retired"
  else
    "active"
  end
end

tag_names = {
  php: "#6082BB",
  ruby: "#A61501",
  front_end: "#226666",
  javascript: "#0095DD",
  node: "#80BD01",
  python: "#FFDC52",
  django: "#44B78B",
  remote: "#AA6C39"
}

#Tag Names
TagName.delete_all()
tag_names.each do |name, color|
  TagName.create(name: name, color: color)
end

#Users
puts "creating users..."
user_count = 100
demo_user = Random.rand(user_count)
demo_admin = Random.rand(user_count)

user_count.times do |index|
  if index == demo_user
    name = Faker::Name.name
    @demo_user = User.create(
      full_name: name,
      email: Faker::Internet.email(name),
      nickname: Faker::Internet.user_name(name),
      provider: "github",
      token: Faker::Bitcoin.address,
      uid: Faker::Code.ean,
      image_url: Faker::Avatar.image( Faker::Bitcoin.address,"50x50", "jpg"),
    )
  elsif index == demo_admin
    name = Faker::Name.name
    @demo_admin = User.create(
      full_name: name,
      email: Faker::Internet.email(name),
      nickname: Faker::Internet.user_name(name),
      provider: "github",
      token: Faker::Bitcoin.address,
      uid: Faker::Code.ean,
      image_url: Faker::Avatar.image( Faker::Bitcoin.address,"50x50", "jpg"),
      role: 1
    )
  else
    name = Faker::Name.name
    user =   User.create(
      full_name: name,
      email: Faker::Internet.email(name),
      nickname: Faker::Internet.user_name(name),
      provider: "github",
      token: Faker::Bitcoin.address,
      uid: Faker::Code.ean,
      image_url: Faker::Avatar.image( Faker::Bitcoin.address,"50x50", "jpg")
    )
    user_tag_names = TagName.all.sample(Random.rand(TagName.all.count))
    user_tag_names.each do |tag_name|
      user.tags << Tag.new(tag_name_id: tag_name.id)
    end
  end
end


#businesses
puts "creating businesses..."
business_count = 35
user_list = User.all

business_count.times do |index|
  business = Business.new(
    name: Faker::Company.name,
    about: Faker::Company.catch_phrase,
  )
  Random.rand(4).times do
    business.addresses <<  gen_address
  end
  business.user = user_list.shuffle.pop
  business.save
end

#Jobs
puts "creating jobs..."
jobs_count = 300

jobs_count.times do |index|
  job = Job.new(
    title: Faker::Name.title,
    description: Faker::Lorem.paragraphs(Random.rand(3)),
    benefits: Faker::Lorem.paragraphs(Random.rand(1)),
    status: random_job_status
  )
  job.business = Business.all.sample
  job.save
end


