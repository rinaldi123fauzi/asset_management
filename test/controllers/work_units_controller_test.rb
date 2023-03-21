require 'test_helper'

class WorkUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_unit = work_units(:one)
  end

  test "should get index" do
    get work_units_url
    assert_response :success
  end

  test "should get new" do
    get new_work_unit_url
    assert_response :success
  end

  test "should create work_unit" do
    assert_difference('WorkUnit.count') do
      post work_units_url, params: { work_unit: { nama: @work_unit.nama } }
    end

    assert_redirected_to work_unit_url(WorkUnit.last)
  end

  test "should show work_unit" do
    get work_unit_url(@work_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_unit_url(@work_unit)
    assert_response :success
  end

  test "should update work_unit" do
    patch work_unit_url(@work_unit), params: { work_unit: { nama: @work_unit.nama } }
    assert_redirected_to work_unit_url(@work_unit)
  end

  test "should destroy work_unit" do
    assert_difference('WorkUnit.count', -1) do
      delete work_unit_url(@work_unit)
    end

    assert_redirected_to work_units_url
  end
end
