require "test_helper"

class CanSignUpTest < Capybara::Rails::TestCase
  test "Sign up can view Timeline" do

    me = User.create username: "me", email: "me@example.com", password: "12345678"

    visit root_path
    click_link "Sign Up"
    fill_in "Username", with: "me"
    fill_in "Email", with: "me@example.com"
    fill_in "Password", with: "12345678"
    fill_in "Confirm Password", with: "12345678"
    click_button "Sign Up"

    assert_content page, "Timeline"

  end
end
