require 'test_helper'

class InductionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @induction = inductions(:one)
  end

  test "should get index" do
    get inductions_url
    assert_response :success
  end

  test "should get new" do
    get new_induction_url
    assert_response :success
  end

  test "should create induction" do
    assert_difference('Induction.count') do
      post inductions_url, params: { induction: { name: @induction.name, nilai_tes: @induction.nilai_tes, tanggal: @induction.tanggal, worker_id: @induction.worker_id } }
    end

    assert_redirected_to induction_url(Induction.last)
  end

  test "should show induction" do
    get induction_url(@induction)
    assert_response :success
  end

  test "should get edit" do
    get edit_induction_url(@induction)
    assert_response :success
  end

  test "should update induction" do
    patch induction_url(@induction), params: { induction: { name: @induction.name, nilai_tes: @induction.nilai_tes, tanggal: @induction.tanggal, worker_id: @induction.worker_id } }
    assert_redirected_to induction_url(@induction)
  end

  test "should destroy induction" do
    assert_difference('Induction.count', -1) do
      delete induction_url(@induction)
    end

    assert_redirected_to inductions_url
  end
end
