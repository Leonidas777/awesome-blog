object false

node(:success) { true }

node :post do
  partial('api/v1/posts/shared/post', object: @resource)
end
