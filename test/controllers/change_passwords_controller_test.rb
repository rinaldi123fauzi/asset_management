require 'test_helper'

class ChangePasswordsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get change_passwords_edit_url
    assert_response :success
  end

end
