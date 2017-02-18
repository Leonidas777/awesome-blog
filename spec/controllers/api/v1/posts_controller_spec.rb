require 'rails_helper'

describe Api::V1::PostsController, type: :controller do
  render_views

  describe '#index' do
    Given { @post_1 = create :post }
    Given { @post_2 = create :post }
    Given { @post_3 = create :post }
    Given { @post_4 = create :post }

    Given { create :rate, post: @post_1, value: 5 }
    Given { create :rate, post: @post_1, value: 4 }

    Given { create :rate, post: @post_2, value: 1 }
    Given { create :rate, post: @post_2, value: 2 }

    Given { create :rate, post: @post_3, value: 3 }
    Given { create :rate, post: @post_3, value: 4 }

    Given { create :rate, post: @post_4, value: 2 }
    Given { create :rate, post: @post_4, value: 2 }

    context 'when getting 3 most popular posts' do
      When { get :index, params: { format: :json, number: 3 } }
      Then { expect(JSON.parse(response.body)).to eq('posts' => [simple_post_json(@post_1), 
                                                                 simple_post_json(@post_3),
                                                                 simple_post_json(@post_4)]) }
      And { expect(response.status).to eq 200 }
    end
  end

  describe '#create' do
    When { post :create, params: params }

    context 'when user exists' do
      Given(:params) { { format: :json, user_login: 'leo', post: { name: 'New group', description: 'Some text.', author_id: '153.101.209.83' } } }
      Given { @user = create :user, login: 'leo' }
      Then  { expect(JSON.parse(response.body)).to eq({ 'success' => true, 'post' => post_json(Post.last) }) }
      And   { expect(response.status).to eq 201 }
      And   { expect(Post.count).to eq 1 }
      And   { expect(@user.posts).to eq [Post.last] }
    end

    context 'when user does not exist' do
      Given(:params) { { format: :json, user_login: 'leo', post: { name: 'New group', description: 'Some text.', author_id: '153.101.209.83' } } }
      Then { expect(JSON.parse(response.body)).to eq({ 'success' => true, 'post' => post_json(Post.last) }) }
      And  { expect(response.status).to eq 201 }
      And  { expect(Post.count).to eq 1 }
      And  { expect(User.count).to eq 1 }
      And  { expect(User.last.posts).to eq [Post.last] }
    end

    context 'when name has not been passed' do
      Given(:params) { { format: :json, user_login: 'leo', post: { name: nil, description: 'Some text.', author_id: '153.101.209.83' } } }
      Then { expect(JSON.parse(response.body)).to eq({ 'success'    => false, 
                                                       'all_errors' => ["Name can't be blank"], 
                                                       'errors'     => { 'name' => ["can't be blank"] } }) }
      And  { expect(response.status).to eq 422 }
      And  { expect(Post.count).to eq 0 }
      And  { expect(User.count).to eq 1 }
    end

    context 'when description has not been passed' do
      Given(:params) { { format: :json, user_login: 'leo', post: { name: 'New group', description: nil, author_id: '153.101.209.83' } } }
      Then { expect(JSON.parse(response.body)).to eq({ 'success'    => false, 
                                                       'all_errors' => ["Description can't be blank"], 
                                                       'errors'     => { 'description' => ["can't be blank"] } }) }
      And  { expect(response.status).to eq 422 }
      And  { expect(Post.count).to eq 0 }
      And  { expect(User.count).to eq 1 }
    end
  end
end
