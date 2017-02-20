puts 'Creating users'
users = FactoryGirl.create_list(:user, 100)

puts 'Generating ip addresses'
ip_addresses = (1..50).map { Faker::Internet.ip_v4_address }

puts 'Creating posts'
200_000.times do |number|
  params = { 'user_login' => users[rand(0..99)].login, 'post' => { 'name'        => "Post-#{number}",
                                                                   'description' => Faker::Lorem.paragraph,
                                                                   'author_ip'   => ip_addresses[rand(0..49)] } }

  response = RestClient.post("#{ENV['HOST']}/api/v1/posts", params)
  puts "Post-#{number}"
end

puts 'Rating some posts'
Post.all.last(130_000).each do |post|
  (rand(1..5)).times do |number|
    params = { rate: { value: rand(1..5) } }
    response = RestClient.post("#{ENV['HOST']}/api/v1/posts/#{post.id}/rates", params)
    puts "Rate-#{number}"
   end
end
