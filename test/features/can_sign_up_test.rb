require "test_helper"

class CanSignUpTest < Capybara::Rails::TestCase
  test "Sign up can view Timeline, follow user, see twits" do

    me = User.create username: "me", email: "me@example.com", password: "12345678"
    batman = User.create username: "batman", email: "bruce@wayneenterprise.com", password: "AlfredSux"
    batman.twits.create body: "I am the night!"
    me.twits.create body: "My First Twit"

    visit root_path
    click_link "Sign Up"
    fill_in "Username", with: "me"
    fill_in "Email", with: "me@example.com"
    fill_in "Password", with: "12345678"
    fill_in "Confirm Password", with: "12345678"
    click_button "Sign Up"

    assert_content page, "Timeline"

    click_link "Follow batman"

    assert_content page, "I am the night!"

  end
end
