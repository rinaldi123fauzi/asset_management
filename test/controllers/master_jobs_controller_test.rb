require 'test_helper'

class MasterJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_job = master_jobs(:one)
  end

  test "should get index" do
    get master_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_master_job_url
    assert_response :success
  end

  test "should create master_job" do
    assert_difference('MasterJob.count') do
      post master_jobs_url, params: { master_job: { harga_satuan: @master_job.harga_satuan, material_type_id: @master_job.material_type_id, nama_pekerjaan: @master_job.nama_pekerjaan, persen_bobot: @master_job.persen_bobot, sub_work_category_id: @master_job.sub_work_category_id, total_harga: @master_job.total_harga, unit_id: @master_job.unit_id, volume: @master_job.volume, work_category_id: @master_job.work_category_id } }
    end

    assert_redirected_to master_job_url(MasterJob.last)
  end

  test "should show master_job" do
    get master_job_url(@master_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_job_url(@master_job)
    assert_response :success
  end

  test "should update master_job" do
    patch master_job_url(@master_job), params: { master_job: { harga_satuan: @master_job.harga_satuan, material_type_id: @master_job.material_type_id, nama_pekerjaan: @master_job.nama_pekerjaan, persen_bobot: @master_job.persen_bobot, sub_work_category_id: @master_job.sub_work_category_id, total_harga: @master_job.total_harga, unit_id: @master_job.unit_id, volume: @master_job.volume, work_category_id: @master_job.work_category_id } }
    assert_redirected_to master_job_url(@master_job)
  end

  test "should destroy master_job" do
    assert_difference('MasterJob.count', -1) do
      delete master_job_url(@master_job)
    end

    assert_redirected_to master_jobs_url
  end
end
