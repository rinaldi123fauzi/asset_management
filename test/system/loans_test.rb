require "application_system_test_case"

class LoansTest < ApplicationSystemTestCase
  setup do
    @loan = loans(:one)
  end

  test "visiting the index" do
    visit loans_url
    assert_selector "h1", text: "Loans"
  end

  test "creating a Loan" do
    visit loans_url
    click_on "New Loan"

    fill_in "Deskripsi", with: @loan.deskripsi
    fill_in "From date", with: @loan.from_date
    fill_in "Jumlah", with: @loan.jumlah
    fill_in "Penanggung jawab", with: @loan.penanggung_jawab
    fill_in "Software", with: @loan.software_id
    fill_in "Status", with: @loan.status
    fill_in "To date", with: @loan.to_date
    fill_in "Tool", with: @loan.tool_id
    fill_in "User", with: @loan.user_id
    click_on "Create Loan"

    assert_text "Loan was successfully created"
    click_on "Back"
  end

  test "updating a Loan" do
    visit loans_url
    click_on "Edit", match: :first

    fill_in "Deskripsi", with: @loan.deskripsi
    fill_in "From date", with: @loan.from_date
    fill_in "Jumlah", with: @loan.jumlah
    fill_in "Penanggung jawab", with: @loan.penanggung_jawab
    fill_in "Software", with: @loan.software_id
    fill_in "Status", with: @loan.status
    fill_in "To date", with: @loan.to_date
    fill_in "Tool", with: @loan.tool_id
    fill_in "User", with: @loan.user_id
    click_on "Update Loan"

    assert_text "Loan was successfully updated"
    click_on "Back"
  end

  test "destroying a Loan" do
    visit loans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loan was successfully destroyed"
  end
end
