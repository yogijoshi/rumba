require 'test_helper'

class StoresControllerTest < ActionController::TestCase
  test "should get relatedstores" do
    get :relatedstores
    assert_response :success
  end

end
