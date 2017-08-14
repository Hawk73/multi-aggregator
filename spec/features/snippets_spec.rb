require 'rails_helper'

RSpec.feature 'Snippets', type: :feature do
  given(:user) { create(:user) }

  feature 'Creating snippet' do
    given(:snippet) { build(:snippet) }

    background do
      sign_in(user)
      visit '/snippets/new'
    end

    scenario 'Creating with correct params' do
      fill_in 'Name', with: snippet.name
      fill_in 'Text', with: snippet.text
      click_button 'Create'

      expect(page).to have_content('Snippet has been created successfully.')
    end

    scenario 'Creating with invalid params' do
      fill_in 'Name', with: ''
      fill_in 'Text', with: snippet.text
      click_button 'Create'

      expect(page).not_to have_content('Snippet has been created successfully.')
      expect(page).to have_content("can't be blank")
    end
  end

  feature 'Viewing snippet' do
    given!(:snippet) { create(:snippet, user: user) }

    background { sign_in(user) }

    scenario 'Viewing exists snippet' do
      visit "/snippets/#{snippet.id}"
      expect_have_snippet(snippet)
    end

    scenario 'Viewing exists snippet with comments' do
      comments = create_list(:comment, 3, snippet: snippet)
      visit "/snippets/#{snippet.id}"
      expect_have_snippet_with_comments(snippet, comments)
    end
  end
end
