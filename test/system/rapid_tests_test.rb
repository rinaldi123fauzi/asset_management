require "application_system_test_case"

class RapidTestsTest < ApplicationSystemTestCase
  setup do
    @rapid_test = rapid_tests(:one)
  end

  test "visiting the index" do
    visit rapid_tests_url
    assert_selector "h1", text: "Rapid Tests"
  end

  test "creating a Rapid test" do
    visit rapid_tests_url
    click_on "New Rapid Test"

    fill_in "Status", with: @rapid_test.status
    fill_in "Tanggal", with: @rapid_test.tanggal
    fill_in "Worker", with: @rapid_test.worker_id
    click_on "Create Rapid test"

    assert_text "Rapid test was successfully created"
    click_on "Back"
  end

  test "updating a Rapid test" do
    visit rapid_tests_url
    click_on "Edit", match: :first

    fill_in "Status", with: @rapid_test.status
    fill_in "Tanggal", with: @rapid_test.tanggal
    fill_in "Worker", with: @rapid_test.worker_id
    click_on "Update Rapid test"

    assert_text "Rapid test was successfully updated"
    click_on "Back"
  end

  test "destroying a Rapid test" do
    visit rapid_tests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rapid test was successfully destroyed"
  end
end
