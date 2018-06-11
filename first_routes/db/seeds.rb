# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.all
# 10.times do |i|
#   users << User.create!({username: "dumb dumb #{i}"})
# end

artwork = []
20.times do |i|
  artwork << Artwork.create({ title: "ugly ugly #{i}", image_url: "#{i}.#{i}", artist_id: users.sample.id })
end

arr = []
15.times do |i|
  art_id = artwork.sample.id
  user_id = users.sample.id
  attempt = [art_id, user_id]
  
  next if arr.include? attempt
  arr += [art_id, user_id]
  ArtworkShare.create({ artwork_id: art_id, viewer_id: user_id })
end

