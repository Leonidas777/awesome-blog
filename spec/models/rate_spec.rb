require 'rails_helper'

describe Rate do
  it { should belong_to(:post) }
  it { should validate_presence_of :value }
  it { should ensure_inclusion_of(:value).in_range(1..5) }
end
