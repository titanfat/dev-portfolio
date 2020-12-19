# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
9.times do |portfolio_items|
  Portfolio.create!(
      title: "Portfolio title: #{portfolio_items}",
      subtitle: "My great service",
      body: "Lorem ipsum.",
      main_image:"https://via.placeholder.com/600x200",
      thumb_image:"https://via.placeholder.com/350x200"
  )
      end