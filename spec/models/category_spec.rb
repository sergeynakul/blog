require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:posts) }
  it { should have_many(:comments) }

  let(:category) { create(:category) }
 
  describe "when name format is invalid" do
    it "should be invalid" do
      names = %w["example category.", "Example category", "E category.", "Example c.", "Example Category."]
      names.each do |invalid_name|
        category.name = invalid_name
        expect(category).not_to be_valid
      end
    end
  end
end
