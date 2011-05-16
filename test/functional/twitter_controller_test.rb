require 'test_helper'

class TwitterControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get finalize" do
    get :finalize
    assert_response :success
  end

end
