node :posts do
  @posts.map do |post|
    partial('api/v1/posts/shared/simple_post', object: post)
  end
end
