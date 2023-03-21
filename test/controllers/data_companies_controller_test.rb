require 'test_helper'

class DataCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_company = data_companies(:one)
  end

  test "should get index" do
    get data_companies_url
    assert_response :success
  end

  test "should get new" do
    get new_data_company_url
    assert_response :success
  end

  test "should create data_company" do
    assert_difference('DataCompany.count') do
      post data_companies_url, params: { data_company: { alamat: @data_company.alamat, area: @data_company.area, category_id: @data_company.category_id, cluster: @data_company.cluster, daftar_pekerjaan: @data_company.daftar_pekerjaan, lokasi_kerja: @data_company.lokasi_kerja, nama_entitas: @data_company.nama_entitas, website: @data_company.website } }
    end

    assert_redirected_to data_company_url(DataCompany.last)
  end

  test "should show data_company" do
    get data_company_url(@data_company)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_company_url(@data_company)
    assert_response :success
  end

  test "should update data_company" do
    patch data_company_url(@data_company), params: { data_company: { alamat: @data_company.alamat, area: @data_company.area, category_id: @data_company.category_id, cluster: @data_company.cluster, daftar_pekerjaan: @data_company.daftar_pekerjaan, lokasi_kerja: @data_company.lokasi_kerja, nama_entitas: @data_company.nama_entitas, website: @data_company.website } }
    assert_redirected_to data_company_url(@data_company)
  end

  test "should destroy data_company" do
    assert_difference('DataCompany.count', -1) do
      delete data_company_url(@data_company)
    end

    assert_redirected_to data_companies_url
  end
end
