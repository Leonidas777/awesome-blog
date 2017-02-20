attributes :id

node(:user_id)      { |post| post.user_id }
node(:name)         { |post| post.name }
node(:description)  { |post| post.description }
node(:author_ip)    { |post| post.author_ip }
node(:average_rate) { |post| post.average_rate_count }
