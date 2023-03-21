require 'test_helper'

class AdditionalJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @additional_job = additional_jobs(:one)
  end

  test "should get index" do
    get additional_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_additional_job_url
    assert_response :success
  end

  test "should create additional_job" do
    assert_difference('AdditionalJob.count') do
      post additional_jobs_url, params: { additional_job: { harga_satuan: @additional_job.harga_satuan, kategori: @additional_job.kategori, master_job_id: @additional_job.master_job_id, total_harga: @additional_job.total_harga, volume: @additional_job.volume } }
    end

    assert_redirected_to additional_job_url(AdditionalJob.last)
  end

  test "should show additional_job" do
    get additional_job_url(@additional_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_additional_job_url(@additional_job)
    assert_response :success
  end

  test "should update additional_job" do
    patch additional_job_url(@additional_job), params: { additional_job: { harga_satuan: @additional_job.harga_satuan, kategori: @additional_job.kategori, master_job_id: @additional_job.master_job_id, total_harga: @additional_job.total_harga, volume: @additional_job.volume } }
    assert_redirected_to additional_job_url(@additional_job)
  end

  test "should destroy additional_job" do
    assert_difference('AdditionalJob.count', -1) do
      delete additional_job_url(@additional_job)
    end

    assert_redirected_to additional_jobs_url
  end
end
