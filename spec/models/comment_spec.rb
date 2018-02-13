require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:content) }
  it { should belong_to(:commentable) }

  let(:comment) { create(:comment) }
 
  describe "when author format is invalid" do
    it "should be invalid" do
      authors = %w["example author.", "Example author", "E author.", "Example a.", "example Author."]
      authors.each do |invalid_name|
        comment.author = invalid_name
        expect(comment).not_to be_valid
      end
    end
  end
end
