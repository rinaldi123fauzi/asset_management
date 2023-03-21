require 'test_helper'

class WorkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @worker = workers(:one)
  end

  test "should get index" do
    get workers_url
    assert_response :success
  end

  test "should get new" do
    get new_worker_url
    assert_response :success
  end

  test "should create worker" do
    assert_difference('Worker.count') do
      post workers_url, params: { worker: { address: @worker.address, jabatan: @worker.jabatan, ktp: @worker.ktp, site_project_id: @worker.site_project_id, telp: @worker.telp, type_worker_id: @worker.type_worker_id, uid: @worker.uid, user_id: @worker.user_id } }
    end

    assert_redirected_to worker_url(Worker.last)
  end

  test "should show worker" do
    get worker_url(@worker)
    assert_response :success
  end

  test "should get edit" do
    get edit_worker_url(@worker)
    assert_response :success
  end

  test "should update worker" do
    patch worker_url(@worker), params: { worker: { address: @worker.address, jabatan: @worker.jabatan, ktp: @worker.ktp, site_project_id: @worker.site_project_id, telp: @worker.telp, type_worker_id: @worker.type_worker_id, uid: @worker.uid, user_id: @worker.user_id } }
    assert_redirected_to worker_url(@worker)
  end

  test "should destroy worker" do
    assert_difference('Worker.count', -1) do
      delete worker_url(@worker)
    end

    assert_redirected_to workers_url
  end
end
