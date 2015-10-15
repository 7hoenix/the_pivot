
# users

User.create(full_name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com" , display_name: nil, password: "password", role: 0)
User.create(full_name: "Jeff Casimir", email: "demo+jeff@jumpstartlab.com", display_name: "j3", password: "password", role: 0)
User.create(full_name: "Jorge Tellez", email: "demo+jorge@jumpstartlab.com", display_name: "novohispano", password: "password", role: 0)
User.create(full_name: "Josh Cheek", email: "demo+josh@jumpstartlab.com", display_name: "josh", password: "password", role: 1)
User.create(full_name: 'D G', email: "dg", display_name: 'Synergy', password: 'dg', role: 1)



Job.create(title: "senior rails dev", description: "all the backend stuff", business_id: 2, address_id: 4)
Job.create(title: "junior rails dev", description: "all the backend stuff", business_id: 2, address_id: 4)

Job.create(title: "senior php dev", description: "all the backend stuff", business_id: 2, address_id: 4)
Job.create(title: "junior php dev", description: "all the backend stuff", business_id: 2, address_id: 4)


Job.create(title: "Front End Developer", description: "Makes things look pretty and functional", benefits: "Tons of PTO", business_id: 3)



Business.create(name: "Pivotal Labs", about: "Make sick products for other people.")
Business.create(name: "Facebook", about: "You wish you worked here.")
