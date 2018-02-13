require 'rails_helper'

feature 'Create post', %q{
	In order to create posts to a category
	As an any user
	I want to be able to create posts
} do

	given(:category) { create(:category) }

	scenario 'Any user creates post' do
		visit category_path(category)
		within '.post_form' do
			fill_in 'Name', with: 'Test post.'
			fill_in 'Content', with: 'Test content.'
		end
		click_on 'Create Post'

		expect(page).to have_content 'Post was successfully created.'
		expect(page).to have_content "Test post."
		expect(page).to have_content "Test content."
		post = Post.last
		expect(current_path).to eq category_post_path(category_id: category.id, id: post.id)
	end
end