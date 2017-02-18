require 'rails_helper'

describe Post do
  it { should belong_to(:user) }
  it { should have_many(:rates).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }

  describe '::average_rate' do
    Given { @post = create :post }
    Given { @rate1 = create :rate, post: @post, value: 5 }
    Given { @rate2 = create :rate, post: @post, value: 2 }
    Given { @rate3 = create :rate, post: @post, value: 1 }
    Then  { expect(@post.average_rate).to eq 2.67 }
  end
end
