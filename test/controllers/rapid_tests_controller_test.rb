require 'test_helper'

class RapidTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rapid_test = rapid_tests(:one)
  end

  test "should get index" do
    get rapid_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_rapid_test_url
    assert_response :success
  end

  test "should create rapid_test" do
    assert_difference('RapidTest.count') do
      post rapid_tests_url, params: { rapid_test: { status: @rapid_test.status, tanggal: @rapid_test.tanggal, worker_id: @rapid_test.worker_id } }
    end

    assert_redirected_to rapid_test_url(RapidTest.last)
  end

  test "should show rapid_test" do
    get rapid_test_url(@rapid_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_rapid_test_url(@rapid_test)
    assert_response :success
  end

  test "should update rapid_test" do
    patch rapid_test_url(@rapid_test), params: { rapid_test: { status: @rapid_test.status, tanggal: @rapid_test.tanggal, worker_id: @rapid_test.worker_id } }
    assert_redirected_to rapid_test_url(@rapid_test)
  end

  test "should destroy rapid_test" do
    assert_difference('RapidTest.count', -1) do
      delete rapid_test_url(@rapid_test)
    end

    assert_redirected_to rapid_tests_url
  end
end
