require 'rails_helper'

RSpec.feature 'Requests', type: :feature do
  given(:user) { create(:user) }

  feature 'Adding request' do
    given!(:provider) { create(:provider) }
    given(:request) { build(:request, user: user) }

    background do
      sign_in(user)
      visit "/providers/#{provider.id}"
    end

    scenario 'Adding valid request to exists provider' do
      fill_in 'Leave a request', with: request.text
      click_button 'Add request'

      expect(page).to have_content('Request has been added successfully.')
      expect_have_request(request)
    end
  end
end
