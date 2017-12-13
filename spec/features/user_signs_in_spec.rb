require "rails_helper"

feature "user signs in" do

  context "valid account" do
    let(:user) { create :user, confirmed_at: Time.current }
    # scenario "via email" do
    #   sign_in(user)
    #
    #   expect(page).to have_content("Signed in")
    #   expect(page).to have_content user.handle
    # end

    scenario "via username" do
      visit root_path
      fill_in :session_login, with: user.handle
      fill_in :session_password, with: user.password
      find('input[type="submit"]').click

      expect(page).to have_content("Sign Out")
    end

    # scenario "already signed in" do
    #   sign_in(user)
    #
    #   visit root_path
    #
    #   expect(page).to have_content("You are already signed in.")
    # end
  end

  context "invalid information" do
    let(:user) { create :user }
    scenario "no details" do
      visit root_path
      find('input[type="submit"]').click
      expect(page).to have_content("Invalid email/username & password combination.")
    end

    # scenario "unconfirmed email" do
    #   user.update(confirmed_at: nil)
    #   sign_in(user)
    #
    #   expect(page).to have_content("You need to confirm your email address before continuing.")
    #   expect(page).to_not have_link("Sign Out")
    # end

    scenario "wrong details" do
      visit root_path
      fill_in :session_login ,with: user.handle
      fill_in :session_password, with: "nomatch"
      find('input[type="submit"]').click

      expect(page).to have_content("Invalid email/username & password combination.")
    end
  end

end
