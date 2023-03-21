require "application_system_test_case"

class TypeWorkersTest < ApplicationSystemTestCase
  setup do
    @type_worker = type_workers(:one)
  end

  test "visiting the index" do
    visit type_workers_url
    assert_selector "h1", text: "Type Workers"
  end

  test "creating a Type worker" do
    visit type_workers_url
    click_on "New Type Worker"

    fill_in "Name", with: @type_worker.name
    click_on "Create Type worker"

    assert_text "Type worker was successfully created"
    click_on "Back"
  end

  test "updating a Type worker" do
    visit type_workers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @type_worker.name
    click_on "Update Type worker"

    assert_text "Type worker was successfully updated"
    click_on "Back"
  end

  test "destroying a Type worker" do
    visit type_workers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Type worker was successfully destroyed"
  end
end
