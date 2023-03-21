require "application_system_test_case"

class MaterialTypesTest < ApplicationSystemTestCase
  setup do
    @material_type = material_types(:one)
  end

  test "visiting the index" do
    visit material_types_url
    assert_selector "h1", text: "Material Types"
  end

  test "creating a Material type" do
    visit material_types_url
    click_on "New Material Type"

    fill_in "Nama material", with: @material_type.nama_material
    click_on "Create Material type"

    assert_text "Material type was successfully created"
    click_on "Back"
  end

  test "updating a Material type" do
    visit material_types_url
    click_on "Edit", match: :first

    fill_in "Nama material", with: @material_type.nama_material
    click_on "Update Material type"

    assert_text "Material type was successfully updated"
    click_on "Back"
  end

  test "destroying a Material type" do
    visit material_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Material type was successfully destroyed"
  end
end
