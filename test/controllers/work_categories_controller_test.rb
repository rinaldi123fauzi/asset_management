require 'test_helper'

class WorkCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_category = work_categories(:one)
  end

  test "should get index" do
    get work_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_work_category_url
    assert_response :success
  end

  test "should create work_category" do
    assert_difference('WorkCategory.count') do
      post work_categories_url, params: { work_category: { nama_kategori: @work_category.nama_kategori } }
    end

    assert_redirected_to work_category_url(WorkCategory.last)
  end

  test "should show work_category" do
    get work_category_url(@work_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_category_url(@work_category)
    assert_response :success
  end

  test "should update work_category" do
    patch work_category_url(@work_category), params: { work_category: { nama_kategori: @work_category.nama_kategori } }
    assert_redirected_to work_category_url(@work_category)
  end

  test "should destroy work_category" do
    assert_difference('WorkCategory.count', -1) do
      delete work_category_url(@work_category)
    end

    assert_redirected_to work_categories_url
  end
end
