require "application_system_test_case"

class SubWorkCategoriesTest < ApplicationSystemTestCase
  setup do
    @sub_work_category = sub_work_categories(:one)
  end

  test "visiting the index" do
    visit sub_work_categories_url
    assert_selector "h1", text: "Sub Work Categories"
  end

  test "creating a Sub work category" do
    visit sub_work_categories_url
    click_on "New Sub Work Category"

    fill_in "Nama subkategori", with: @sub_work_category.nama_subkategori
    fill_in "Work category", with: @sub_work_category.work_category_id
    click_on "Create Sub work category"

    assert_text "Sub work category was successfully created"
    click_on "Back"
  end

  test "updating a Sub work category" do
    visit sub_work_categories_url
    click_on "Edit", match: :first

    fill_in "Nama subkategori", with: @sub_work_category.nama_subkategori
    fill_in "Work category", with: @sub_work_category.work_category_id
    click_on "Update Sub work category"

    assert_text "Sub work category was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub work category" do
    visit sub_work_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub work category was successfully destroyed"
  end
end
