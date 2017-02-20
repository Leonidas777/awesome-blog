def post_json(post, custom_fields={})
  {
    'id'           => post.id,
    'user_id'      => post.user_id,
    'name'         => post.name,
    'description'  => post.description,
    'author_ip'    => post.author_ip,
    'average_rate' => post.average_rate_count
  }.deep_merge(custom_fields)
end

def simple_post_json(post, custom_fields={})
  {
    'name'         => post.name,
    'description'  => post.description,
    'average_rate' => post.average_rate_count
  }.deep_merge(custom_fields)
end
