require 'rails_helper'

RSpec.feature 'Providers', type: :feature do
  given(:user) { create(:user) }

  feature 'Creating provider' do
    given(:provider) { build(:provider) }

    background do
      sign_in(user)
      visit '/providers/new'
    end

    scenario 'Creating with correct params' do
      fill_in 'Name', with: provider.name
      fill_in 'Text', with: provider.text
      click_button 'Create'

      expect(page).to have_content('Provider has been created successfully.')
    end

    scenario 'Creating with invalid params' do
      fill_in 'Name', with: ''
      fill_in 'Text', with: provider.text
      click_button 'Create'

      expect(page).not_to have_content('Provider has been created successfully.')
      expect(page).to have_content("can't be blank")
    end
  end

  feature 'Viewing provider' do
    given!(:provider) { create(:provider, user: user) }

    background { sign_in(user) }

    scenario 'Viewing exists provider' do
      visit "/providers/#{provider.id}"
      expect_have_provider(provider)
    end

    scenario 'Viewing exists provider with requests' do
      requests = create_list(:request, 3, provider: provider)
      visit "/providers/#{provider.id}"
      expect_have_provider_with_requests(provider, requests)
    end
  end
end
