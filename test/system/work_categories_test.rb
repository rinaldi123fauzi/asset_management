require "application_system_test_case"

class WorkCategoriesTest < ApplicationSystemTestCase
  setup do
    @work_category = work_categories(:one)
  end

  test "visiting the index" do
    visit work_categories_url
    assert_selector "h1", text: "Work Categories"
  end

  test "creating a Work category" do
    visit work_categories_url
    click_on "New Work Category"

    fill_in "Nama kategori", with: @work_category.nama_kategori
    click_on "Create Work category"

    assert_text "Work category was successfully created"
    click_on "Back"
  end

  test "updating a Work category" do
    visit work_categories_url
    click_on "Edit", match: :first

    fill_in "Nama kategori", with: @work_category.nama_kategori
    click_on "Update Work category"

    assert_text "Work category was successfully updated"
    click_on "Back"
  end

  test "destroying a Work category" do
    visit work_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work category was successfully destroyed"
  end
end
