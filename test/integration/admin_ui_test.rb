require 'test_helper'

class AdminUITest < ActionDispatch::IntegrationTest

  test "should login successfully" do
    login_to_admin
    assert(!page.has_text?('Please sign in'))
  end

  test "should see the navigation bar" do
    login_to_admin
    # check for the head navigation
    assert(has_link?('Home'))
    assert(has_link?('Documentation'))
    assert(has_link?('Extensions'))
    assert(has_link?('Sign out'))
  end

  test "should have models listed" do
    login_to_admin
    # check to see if there is a way to access the object crud operations

    assert(has_xpath?("//a[@href='/admin/examaobjectmodels']"))

  end

  test "should be able to sign out" do
    login_to_admin
    click_link('Sign out')
    # verify that the user has been signed out and will see the login page.
    assert(page.has_text?('Sign In'))
  end

  test "should see documentation for models" do
    login_to_admin
    visit('/admin/docs')

    assert(click_link('Examaobjectmodels'))

  end

  test "should be able to view extensions" do
    login_to_admin
    click_link('Extensions')
    #assert(has_xpath?("//tbody/tr/td/a[@href='']"))
  end
end
