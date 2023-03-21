require 'test_helper'

class SubWorkCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_work_category = sub_work_categories(:one)
  end

  test "should get index" do
    get sub_work_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_work_category_url
    assert_response :success
  end

  test "should create sub_work_category" do
    assert_difference('SubWorkCategory.count') do
      post sub_work_categories_url, params: { sub_work_category: { nama_subkategori: @sub_work_category.nama_subkategori, work_category_id: @sub_work_category.work_category_id } }
    end

    assert_redirected_to sub_work_category_url(SubWorkCategory.last)
  end

  test "should show sub_work_category" do
    get sub_work_category_url(@sub_work_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_work_category_url(@sub_work_category)
    assert_response :success
  end

  test "should update sub_work_category" do
    patch sub_work_category_url(@sub_work_category), params: { sub_work_category: { nama_subkategori: @sub_work_category.nama_subkategori, work_category_id: @sub_work_category.work_category_id } }
    assert_redirected_to sub_work_category_url(@sub_work_category)
  end

  test "should destroy sub_work_category" do
    assert_difference('SubWorkCategory.count', -1) do
      delete sub_work_category_url(@sub_work_category)
    end

    assert_redirected_to sub_work_categories_url
  end
end
