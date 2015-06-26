require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "show activated user" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select ".user_info", @user.name
  end

  test "show user unactivated" do
    @user.toggle!(:activated)
    get user_path(@user)
    assert_redirected_to root_url
  end
end
