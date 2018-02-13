require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:comments) }
  it { should belong_to(:category) }
end
