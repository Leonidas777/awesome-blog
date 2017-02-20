require 'rails_helper'

describe Rate do
  it { should belong_to(:post) }
  it { should validate_presence_of :value }
  it { should ensure_inclusion_of(:value).in_range(1..5) }

  describe 'caclucates the average post rate' do
    Given { @post = create :post }
    Given { @rate1 = create :rate, post: @post, value: 5 }
    Given { @rate2 = create :rate, post: @post, value: 2 }
    Given { @rate3 = create :rate, post: @post, value: 1 }
    Then  { expect(@post.average_rate_count).to eq 2.67  }
  end
end
