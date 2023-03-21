require 'test_helper'

class AdjustmentJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adjustment_job = adjustment_jobs(:one)
  end

  test "should get index" do
    get adjustment_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_adjustment_job_url
    assert_response :success
  end

  test "should create adjustment_job" do
    assert_difference('AdjustmentJob.count') do
      post adjustment_jobs_url, params: { adjustment_job: { harga_satuan: @adjustment_job.harga_satuan, master_job_id: @adjustment_job.master_job_id, persen_bobot: @adjustment_job.persen_bobot, total_harga: @adjustment_job.total_harga, volume: @adjustment_job.volume } }
    end

    assert_redirected_to adjustment_job_url(AdjustmentJob.last)
  end

  test "should show adjustment_job" do
    get adjustment_job_url(@adjustment_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_adjustment_job_url(@adjustment_job)
    assert_response :success
  end

  test "should update adjustment_job" do
    patch adjustment_job_url(@adjustment_job), params: { adjustment_job: { harga_satuan: @adjustment_job.harga_satuan, master_job_id: @adjustment_job.master_job_id, persen_bobot: @adjustment_job.persen_bobot, total_harga: @adjustment_job.total_harga, volume: @adjustment_job.volume } }
    assert_redirected_to adjustment_job_url(@adjustment_job)
  end

  test "should destroy adjustment_job" do
    assert_difference('AdjustmentJob.count', -1) do
      delete adjustment_job_url(@adjustment_job)
    end

    assert_redirected_to adjustment_jobs_url
  end
end
