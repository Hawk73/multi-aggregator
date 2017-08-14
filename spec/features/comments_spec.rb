require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  given(:user) { create(:user) }

  feature 'Adding comment' do
    given!(:snippet) { create(:snippet) }
    given(:comment) { build(:comment, user: user) }

    background do
      sign_in(user)
      visit "/snippets/#{snippet.id}"
    end

    scenario 'Adding valid comment to exists snippet' do
      fill_in 'Leave a comment', with: comment.text
      click_button 'Add comment'

      expect(page).to have_content('Comment has been added successfully.')
      expect_have_comment(comment)
    end
  end
end
