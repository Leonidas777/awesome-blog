require 'rails_helper'

describe Post do
  it { should belong_to(:user) }
  it { should have_many(:rates).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }  
end
