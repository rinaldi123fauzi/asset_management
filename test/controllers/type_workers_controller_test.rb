require 'test_helper'

class TypeWorkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_worker = type_workers(:one)
  end

  test "should get index" do
    get type_workers_url
    assert_response :success
  end

  test "should get new" do
    get new_type_worker_url
    assert_response :success
  end

  test "should create type_worker" do
    assert_difference('TypeWorker.count') do
      post type_workers_url, params: { type_worker: { name: @type_worker.name } }
    end

    assert_redirected_to type_worker_url(TypeWorker.last)
  end

  test "should show type_worker" do
    get type_worker_url(@type_worker)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_worker_url(@type_worker)
    assert_response :success
  end

  test "should update type_worker" do
    patch type_worker_url(@type_worker), params: { type_worker: { name: @type_worker.name } }
    assert_redirected_to type_worker_url(@type_worker)
  end

  test "should destroy type_worker" do
    assert_difference('TypeWorker.count', -1) do
      delete type_worker_url(@type_worker)
    end

    assert_redirected_to type_workers_url
  end
end
