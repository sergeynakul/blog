require_relative 'acceptance_helper'

feature 'Create comment', %q{
	In order to comment categories or posts
	As an any user
	I want to be able to create comments
} do

	given(:category) { create(:category) }

	scenario 'Any user creates comment for category', js: true do
		visit category_path(category)
		within '.comments' do
			fill_in 'Author', with: 'Test Author.'
			fill_in 'Content', with: 'Test content.'
		end
		click_on 'Create Comment'

		within '.comment_list' do
			expect(page).to have_content "Test Author."
			expect(page).to have_content "Test content."
		end
	end

	given(:post) { create(:post) }

	scenario 'Any user creates comment for post', js: true do
		visit category_post_path(category_id: category.id, id: post.id)
		fill_in 'Author', with: 'Test Author.'
		fill_in 'Content', with: 'Test content.'
		click_on 'Create Comment'

		within '.comment_list' do
			expect(page).to have_content "Test Author."
			expect(page).to have_content "Test content."
		end
	end	
end