# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    email: "admin@maill.com",
    password: "12345666",
    password_confirmation: "12345666",
    name: "Admin User",
    roles: "site_admin"
)


topic = Topic.create!([
                        { title: 'DevOps' },
                        { title: 'Ruby on Rails' },
                        { title: 'Frontend' }
                      ])

puts '3 Topic created'

skill = Skill.create!([
                        { title: 'DevOps', percent_utilized: 15 },
                        { title: 'Ruby on Rails', percent_utilized: 40 },
                        { title: 'Frontend', percent_utilized: 20 }
                      ])

9.times do |portfolio_items|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_items}",
    subtitle: 'Ruby on Rails',
    body: 'Lorem ipsum.',
    main_image: 'https://via.placeholder.com/600x200',
    thumb_image: 'https://via.placeholder.com/350x200'
  )
end

puts '9 portfolio created'

5.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
    topic_id: Topic.last.id
  )
end

puts '5 blog created'

3.times do |tech|
  Portfolio.last.technologies.create!(
    name: "Technology #{tech}"
  )
end

puts '3 Technology created'
