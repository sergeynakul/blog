require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:posts) }
  it { should have_many(:comments) }

  before do
    @category = create(:category)
  end
 
  describe "when name format is invalid" do
    it "should be invalid" do
      name = %w["example category." "Example category" "E category." "Example c." "Example Category."]
      name.each do |invalid_name|
        @сategory.name = invalid_name
        expect(@сategory).not_to be_valid
      end
    end
  end

  describe "when name format is valid" do
    it "should be valid" do
      name = %w["Example category." "Ruby on rails."]
      name.each do |valid_name|
        @сategory.name = valid_name
        expect(@сategory).to be_valid
      end
    end
  end
end
