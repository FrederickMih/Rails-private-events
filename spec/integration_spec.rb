require 'rails_helper'

RSpec.describe 'Integration:', type: :system do
  describe 'Views Index' do
    it 'confirms that the page is being loaded correctly' do
      visit events_path
      expect(page).not_to have_content('something very weird')
    end
    it 'confirms presence of All events' do
      visit events_path
      expect(page).to have_content('All events')
    end
    it 'confirms presence of Log in' do
      visit events_path
      expect(page).to have_content('Log in')
    end
    it 'confirms presence of Username' do
      visit events_path
      expect(page).to have_content('Username')
    end
  end

  describe 'Users Index' do
    it 'confirms that the page is being loaded correctly' do
      visit users_path
      expect(page).not_to have_content('something very weird')
    end
    it 'confirms presence of All Users' do
      visit users_path
      expect(page).to have_content('All Users')
    end
    it 'confirms presence of Log in' do
      visit users_path
      expect(page).to have_content('Log in')
    end
    it 'confirms presence of Sign up' do
      visit users_path
      expect(page).to have_content('Sign up')
    end
    it 'confirms presence of New user' do
      visit users_path
      expect(page).to have_content('New user')
    end
    it 'confirms presence of New Event' do
      visit users_path
      expect(page).to have_content('New Event')
    end
  end
end
