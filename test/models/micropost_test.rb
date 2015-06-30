require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end

  test "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end

  test "should replied to the micropost" do
    orange = microposts(:orange)
    ants   = microposts(:ants)
    assert_not orange.replied_to?(ants)
    # replyを作成
    assert orange.replied_to?(ants)
    # replyを削除(解除ではなく削除)
    assert_not orange.replied_to?(ants)
  end
end
