require 'rails_helper'

describe User do
  it { should have_many(:posts).dependent(:destroy) }
  it { should validate_presence_of(:login) }
  it { should validate_uniqueness_of(:login) }
end
