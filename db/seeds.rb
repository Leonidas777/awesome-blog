puts 'Creating users'
users = FactoryGirl.create_list(:user, 100)

puts 'Generating ip addresses'
ip_addresses = (1..50).map { Faker::Internet.ip_v4_address }

puts 'Creating posts'
1.times do |number|
  params = { 'user_login' => users[rand(0..99)].login, 'post' => { 'name'        => "Post-#{number}",
                                                                   'description' => Faker::Lorem.paragraph,
                                                                   'author_ip'   => ip_addresses[rand(0..49)] } }
  
  # binding.pry
  result = Curl.post('http://localhost:3000/api/v1/posts', params) do |http|
    http.headers['Content-type'] = 'application/json'
  end
  # binding.pry
  # puts result.body_str
end

puts 'Rating some posts'
Post.all.last(120).each do |post|
  params = { rate: { value: rand(1..5) } }

  Curl.post("http://localhost:3000/api/v1/posts/#{post.id}/rates", params)
end
