require "test_helper"

class LogInCanViewSecretTest < Capybara::Rails::TestCase
  test "Cannot view secret when not logged in" do
    me = User.create username: "me", email: "me@example.com", password: "12345678"

    visit root_path

    refute_content page, "Timeline"
  end

  test "Can view secret after sign in" do
    me = User.create username: "me", email: "me@example.com", password: "12345678"

    visit root_path

    fill_in "Username", with: "me"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "Timeline"

  end
end
