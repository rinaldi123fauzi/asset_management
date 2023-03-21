require "application_system_test_case"

class SiteProjectsTest < ApplicationSystemTestCase
  setup do
    @site_project = site_projects(:one)
  end

  test "visiting the index" do
    visit site_projects_url
    assert_selector "h1", text: "Site Projects"
  end

  test "creating a Site project" do
    visit site_projects_url
    click_on "New Site Project"

    fill_in "Name", with: @site_project.name
    click_on "Create Site project"

    assert_text "Site project was successfully created"
    click_on "Back"
  end

  test "updating a Site project" do
    visit site_projects_url
    click_on "Edit", match: :first

    fill_in "Name", with: @site_project.name
    click_on "Update Site project"

    assert_text "Site project was successfully updated"
    click_on "Back"
  end

  test "destroying a Site project" do
    visit site_projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Site project was successfully destroyed"
  end
end
