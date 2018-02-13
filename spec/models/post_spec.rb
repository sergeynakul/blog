require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:comments) }
  it { should belong_to(:category) }

  let(:post) { create(:post) }
 
  describe "when name format is invalid" do
    it "should be invalid" do
      names = %w["example post.", "Example post", "E post.", "Example p.", "Example Post."]
      names.each do |invalid_name|
        post.name = invalid_name
        expect(post).not_to be_valid
      end
    end
  end
end
