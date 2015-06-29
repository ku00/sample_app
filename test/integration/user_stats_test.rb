require 'test_helper'

class UserStatsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    log_in_as(@user)
  end

  test "stats display" do
    get user_path(@user)
    assert_select "a[href=?]", following_user_path(@user)
    assert_select "#following", text: "#{@user.following.count}"
    assert_select "a[href=?]", followers_user_path(@user)
    assert_select "#followers", text: "#{@user.followers.count}"
  end
end
