# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |t|
  User.create(name: Faker::Superhero.name, email: Faker::Internet.free_email, password: '123')
end

User.all.each do |user|
  5.times do |t|
    user.blogs.create(content: Faker::Lorem.paragraph(20))
  end
end

@users = User.all
Blog.all.each do |blog|
  no_comments = rand(10..20)
  no_comments.times do |t|
    blog.comments.create(content: Faker::Lorem.sentence, user_id: @users.sample.id)
  end
end