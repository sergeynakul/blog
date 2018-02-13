require 'rails_helper'

feature 'Create category', %q{
	In order to include posts in the category
	As an any user
	I want to be able to create categories
} do

	scenario 'Any user creates category' do
		visit categories_path
		click_on 'New Category'
		fill_in 'Name', with: 'Test category.'
		fill_in 'Description', with: 'Test description.'
		click_on 'Create Category'

		expect(page).to have_content 'Category was successfully created.'
		expect(page).to have_content "Test category."
		expect(page).to have_content "Test description."
		category = Category.last
		expect(current_path).to eq category_path(category)
	end
end