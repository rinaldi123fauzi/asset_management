require "application_system_test_case"

class InductionsTest < ApplicationSystemTestCase
  setup do
    @induction = inductions(:one)
  end

  test "visiting the index" do
    visit inductions_url
    assert_selector "h1", text: "Inductions"
  end

  test "creating a Induction" do
    visit inductions_url
    click_on "New Induction"

    fill_in "Name", with: @induction.name
    fill_in "Nilai tes", with: @induction.nilai_tes
    fill_in "Tanggal", with: @induction.tanggal
    fill_in "Worker", with: @induction.worker_id
    click_on "Create Induction"

    assert_text "Induction was successfully created"
    click_on "Back"
  end

  test "updating a Induction" do
    visit inductions_url
    click_on "Edit", match: :first

    fill_in "Name", with: @induction.name
    fill_in "Nilai tes", with: @induction.nilai_tes
    fill_in "Tanggal", with: @induction.tanggal
    fill_in "Worker", with: @induction.worker_id
    click_on "Update Induction"

    assert_text "Induction was successfully updated"
    click_on "Back"
  end

  test "destroying a Induction" do
    visit inductions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Induction was successfully destroyed"
  end
end
