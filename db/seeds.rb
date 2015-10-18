require "faker"
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
    User.create(
      full_name: name,
      email: Faker::Internet.email(name),
      display_name: Faker::Internet.user_name(name),
      provider: "github",
      token: Faker::Bitcoin.address,
      uid: Faker::Code.ean,
      image_url: Faker::Avatar.image( Faker::Bitcoin.address,"50x50", "jpg"),
      role: 4
    )
  elsif index == demo_admin
    name = Faker::Name.name
    User.create(
      full_name: name,
      email: Faker::Internet.email(name),
      display_name: Faker::Internet.user_name(name),
      provider: "github",
      token: Faker::Bitcoin.address,
      uid: Faker::Code.ean,
      image_url: Faker::Avatar.image( Faker::Bitcoin.address,"50x50", "jpg"),
      role: 4
    )
  else
    name = Faker::Name.name
    User.create(
      full_name: name,
      email: Faker::Internet.email(name),
      display_name: Faker::Internet.user_name(name),
      provider: "github",
      token: Faker::Bitcoin.address,
      uid: Faker::Code.ean,
      image_url: Faker::Avatar.image( Faker::Bitcoin.address,"50x50", "jpg")
    )
  end
end
