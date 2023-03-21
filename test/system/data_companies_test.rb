require "application_system_test_case"

class DataCompaniesTest < ApplicationSystemTestCase
  setup do
    @data_company = data_companies(:one)
  end

  test "visiting the index" do
    visit data_companies_url
    assert_selector "h1", text: "Data Companies"
  end

  test "creating a Data company" do
    visit data_companies_url
    click_on "New Data Company"

    fill_in "Alamat", with: @data_company.alamat
    fill_in "Area", with: @data_company.area
    fill_in "Category", with: @data_company.category_id
    fill_in "Cluster", with: @data_company.cluster
    fill_in "Daftar pekerjaan", with: @data_company.daftar_pekerjaan
    fill_in "Lokasi kerja", with: @data_company.lokasi_kerja
    fill_in "Nama entitas", with: @data_company.nama_entitas
    fill_in "Website", with: @data_company.website
    click_on "Create Data company"

    assert_text "Data company was successfully created"
    click_on "Back"
  end

  test "updating a Data company" do
    visit data_companies_url
    click_on "Edit", match: :first

    fill_in "Alamat", with: @data_company.alamat
    fill_in "Area", with: @data_company.area
    fill_in "Category", with: @data_company.category_id
    fill_in "Cluster", with: @data_company.cluster
    fill_in "Daftar pekerjaan", with: @data_company.daftar_pekerjaan
    fill_in "Lokasi kerja", with: @data_company.lokasi_kerja
    fill_in "Nama entitas", with: @data_company.nama_entitas
    fill_in "Website", with: @data_company.website
    click_on "Update Data company"

    assert_text "Data company was successfully updated"
    click_on "Back"
  end

  test "destroying a Data company" do
    visit data_companies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Data company was successfully destroyed"
  end
end
