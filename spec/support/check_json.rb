def post_json(post)
  {
    'id'          => post.id,
    'user_id'     => post.user_id,
    'name'        => post.name,
    'description' => post.description,
    'author_ip'   => post.author_ip,
  }
end

def simple_post_json(post)
  {
    'name'        => post.name,
    'description' => post.description
  }
end
