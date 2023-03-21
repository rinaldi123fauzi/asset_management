require 'test_helper'

class SoftwaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @software = softwares(:one)
  end

  test "should get index" do
    get softwares_url
    assert_response :success
  end

  test "should get new" do
    get new_software_url
    assert_response :success
  end

  test "should create software" do
    assert_difference('Software.count') do
      post softwares_url, params: { software: { expired_date: @software.expired_date, kategori: @software.kategori, license_by: @software.license_by, nama: @software.nama, nomor_serial: @software.nomor_serial, vendor_id: @software.vendor_id } }
    end

    assert_redirected_to software_url(Software.last)
  end

  test "should show software" do
    get software_url(@software)
    assert_response :success
  end

  test "should get edit" do
    get edit_software_url(@software)
    assert_response :success
  end

  test "should update software" do
    patch software_url(@software), params: { software: { expired_date: @software.expired_date, kategori: @software.kategori, license_by: @software.license_by, nama: @software.nama, nomor_serial: @software.nomor_serial, vendor_id: @software.vendor_id } }
    assert_redirected_to software_url(@software)
  end

  test "should destroy software" do
    assert_difference('Software.count', -1) do
      delete software_url(@software)
    end

    assert_redirected_to softwares_url
  end
end
