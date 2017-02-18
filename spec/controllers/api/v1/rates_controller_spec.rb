require 'rails_helper'

describe Api::V1::RatesController, type: :controller do
  render_views

  describe '#create' do
    Given { @post = create :post }
    Given { @rate1 = create :rate, post: @post, value: 5 }
    Given { @rate2 = create :rate, post: @post, value: 2 }

    When { post :create, params: params }

    context 'when value is within range' do
      Given(:params) { { format: :json, post_id: @post.id, rate: { value: 4 } } }
      Then { expect(JSON.parse(response.body)).to eq({ 'success' => true, 'average_rate' => '3.67' }) }
      And  { expect(response.status).to eq 201 }
      And  { expect(Rate.count).to eq 3 }
    end

    context 'when value is out of range' do
      Given(:params) { { format: :json, post_id: @post.id, rate: { value: 7 } } }
      Then { expect(JSON.parse(response.body)).to eq({ 'success'    => false, 
                                                       'all_errors' => ['Value is not included in the list'],
                                                       'errors'     => { 'value' =>['is not included in the list'] } }) }
      And  { expect(response.status).to eq 422 }
      And  { expect(Rate.count).to eq 2 }
    end
  end
end
