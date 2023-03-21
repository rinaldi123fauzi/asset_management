require "application_system_test_case"

class AdditionalJobsTest < ApplicationSystemTestCase
  setup do
    @additional_job = additional_jobs(:one)
  end

  test "visiting the index" do
    visit additional_jobs_url
    assert_selector "h1", text: "Additional Jobs"
  end

  test "creating a Additional job" do
    visit additional_jobs_url
    click_on "New Additional Job"

    fill_in "Harga satuan", with: @additional_job.harga_satuan
    fill_in "Kategori", with: @additional_job.kategori
    fill_in "Master job", with: @additional_job.master_job_id
    fill_in "Total harga", with: @additional_job.total_harga
    fill_in "Volume", with: @additional_job.volume
    click_on "Create Additional job"

    assert_text "Additional job was successfully created"
    click_on "Back"
  end

  test "updating a Additional job" do
    visit additional_jobs_url
    click_on "Edit", match: :first

    fill_in "Harga satuan", with: @additional_job.harga_satuan
    fill_in "Kategori", with: @additional_job.kategori
    fill_in "Master job", with: @additional_job.master_job_id
    fill_in "Total harga", with: @additional_job.total_harga
    fill_in "Volume", with: @additional_job.volume
    click_on "Update Additional job"

    assert_text "Additional job was successfully updated"
    click_on "Back"
  end

  test "destroying a Additional job" do
    visit additional_jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Additional job was successfully destroyed"
  end
end
