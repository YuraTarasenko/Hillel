require 'rails_helper'

RSpec.feature "UserSessions" do
  describe 'registration process' do
    it 'registers and shows the success message' do
      user = build(:user)
      visit '/'

      find('#sign-in').click

      find('#user_email').set(user.email)
      find('#user_password').set(user.password)
      find('#user_password_confirmation').set(user.password)

      find('#sign-up-submit').click

      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end
end
