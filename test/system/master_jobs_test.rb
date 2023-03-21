require "application_system_test_case"

class MasterJobsTest < ApplicationSystemTestCase
  setup do
    @master_job = master_jobs(:one)
  end

  test "visiting the index" do
    visit master_jobs_url
    assert_selector "h1", text: "Master Jobs"
  end

  test "creating a Master job" do
    visit master_jobs_url
    click_on "New Master Job"

    fill_in "Harga satuan", with: @master_job.harga_satuan
    fill_in "Material type", with: @master_job.material_type_id
    fill_in "Nama pekerjaan", with: @master_job.nama_pekerjaan
    fill_in "Persen bobot", with: @master_job.persen_bobot
    fill_in "Sub work category", with: @master_job.sub_work_category_id
    fill_in "Total harga", with: @master_job.total_harga
    fill_in "Unit", with: @master_job.unit_id
    fill_in "Volume", with: @master_job.volume
    fill_in "Work category", with: @master_job.work_category_id
    click_on "Create Master job"

    assert_text "Master job was successfully created"
    click_on "Back"
  end

  test "updating a Master job" do
    visit master_jobs_url
    click_on "Edit", match: :first

    fill_in "Harga satuan", with: @master_job.harga_satuan
    fill_in "Material type", with: @master_job.material_type_id
    fill_in "Nama pekerjaan", with: @master_job.nama_pekerjaan
    fill_in "Persen bobot", with: @master_job.persen_bobot
    fill_in "Sub work category", with: @master_job.sub_work_category_id
    fill_in "Total harga", with: @master_job.total_harga
    fill_in "Unit", with: @master_job.unit_id
    fill_in "Volume", with: @master_job.volume
    fill_in "Work category", with: @master_job.work_category_id
    click_on "Update Master job"

    assert_text "Master job was successfully updated"
    click_on "Back"
  end

  test "destroying a Master job" do
    visit master_jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Master job was successfully destroyed"
  end
end
