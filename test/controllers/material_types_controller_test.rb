require 'test_helper'

class MaterialTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_type = material_types(:one)
  end

  test "should get index" do
    get material_types_url
    assert_response :success
  end

  test "should get new" do
    get new_material_type_url
    assert_response :success
  end

  test "should create material_type" do
    assert_difference('MaterialType.count') do
      post material_types_url, params: { material_type: { nama_material: @material_type.nama_material } }
    end

    assert_redirected_to material_type_url(MaterialType.last)
  end

  test "should show material_type" do
    get material_type_url(@material_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_type_url(@material_type)
    assert_response :success
  end

  test "should update material_type" do
    patch material_type_url(@material_type), params: { material_type: { nama_material: @material_type.nama_material } }
    assert_redirected_to material_type_url(@material_type)
  end

  test "should destroy material_type" do
    assert_difference('MaterialType.count', -1) do
      delete material_type_url(@material_type)
    end

    assert_redirected_to material_types_url
  end
end
