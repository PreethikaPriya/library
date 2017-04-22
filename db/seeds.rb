# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@gmail.com',password: 'secret123', role: "admin")
Status.create(name: 'Borrowed')
Status.create(name: 'Collected')
Status.create(name: 'Returned')
Status.create(name: 'Overdue')
Category.create(name: 'Fiction')
Category.create(name: 'Children & Young Adults')
Category.create(name: 'Educational')
Category.create(name: 'Sci-Fi')
Category.create(name: 'Business')