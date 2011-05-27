require 'test_helper'

class ErrorControllerTest < ActionController::TestCase
  test "should get showerror" do
    get :showerror
    assert_response :success
  end

end
