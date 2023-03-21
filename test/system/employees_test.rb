require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "creating a Employee" do
    visit employees_url
    click_on "New Employee"

    fill_in "Alamat", with: @employee.alamat
    fill_in "Email", with: @employee.email
    fill_in "Id identitas", with: @employee.id_identitas
    fill_in "Id pegawai", with: @employee.id_pegawai
    fill_in "Jabatan", with: @employee.jabatan
    fill_in "Nama", with: @employee.nama
    fill_in "Nomor telepon", with: @employee.nomor_telepon
    fill_in "Tanggal lahir", with: @employee.tanggal_lahir
    fill_in "Tempat lahir", with: @employee.tempat_lahir
    fill_in "Work unit", with: @employee.work_unit_id
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "updating a Employee" do
    visit employees_url
    click_on "Edit", match: :first

    fill_in "Alamat", with: @employee.alamat
    fill_in "Email", with: @employee.email
    fill_in "Id identitas", with: @employee.id_identitas
    fill_in "Id pegawai", with: @employee.id_pegawai
    fill_in "Jabatan", with: @employee.jabatan
    fill_in "Nama", with: @employee.nama
    fill_in "Nomor telepon", with: @employee.nomor_telepon
    fill_in "Tanggal lahir", with: @employee.tanggal_lahir
    fill_in "Tempat lahir", with: @employee.tempat_lahir
    fill_in "Work unit", with: @employee.work_unit_id
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "destroying a Employee" do
    visit employees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employee was successfully destroyed"
  end
end
