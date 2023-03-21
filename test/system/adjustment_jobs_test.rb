require "application_system_test_case"

class AdjustmentJobsTest < ApplicationSystemTestCase
  setup do
    @adjustment_job = adjustment_jobs(:one)
  end

  test "visiting the index" do
    visit adjustment_jobs_url
    assert_selector "h1", text: "Adjustment Jobs"
  end

  test "creating a Adjustment job" do
    visit adjustment_jobs_url
    click_on "New Adjustment Job"

    fill_in "Harga satuan", with: @adjustment_job.harga_satuan
    fill_in "Master job", with: @adjustment_job.master_job_id
    fill_in "Persen bobot", with: @adjustment_job.persen_bobot
    fill_in "Total harga", with: @adjustment_job.total_harga
    fill_in "Volume", with: @adjustment_job.volume
    click_on "Create Adjustment job"

    assert_text "Adjustment job was successfully created"
    click_on "Back"
  end

  test "updating a Adjustment job" do
    visit adjustment_jobs_url
    click_on "Edit", match: :first

    fill_in "Harga satuan", with: @adjustment_job.harga_satuan
    fill_in "Master job", with: @adjustment_job.master_job_id
    fill_in "Persen bobot", with: @adjustment_job.persen_bobot
    fill_in "Total harga", with: @adjustment_job.total_harga
    fill_in "Volume", with: @adjustment_job.volume
    click_on "Update Adjustment job"

    assert_text "Adjustment job was successfully updated"
    click_on "Back"
  end

  test "destroying a Adjustment job" do
    visit adjustment_jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adjustment job was successfully destroyed"
  end
end
