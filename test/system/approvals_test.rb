require "application_system_test_case"

class ApprovalsTest < ApplicationSystemTestCase
  setup do
    @approval = approvals(:one)
  end

  test "visiting the index" do
    visit approvals_url
    assert_selector "h1", text: "Approvals"
  end

  test "creating a Approval" do
    visit approvals_url
    click_on "New Approval"

    fill_in "Approve by", with: @approval.approve_by
    fill_in "Approve level", with: @approval.approve_level
    fill_in "Date", with: @approval.date
    fill_in "Loan", with: @approval.loan_id
    click_on "Create Approval"

    assert_text "Approval was successfully created"
    click_on "Back"
  end

  test "updating a Approval" do
    visit approvals_url
    click_on "Edit", match: :first

    fill_in "Approve by", with: @approval.approve_by
    fill_in "Approve level", with: @approval.approve_level
    fill_in "Date", with: @approval.date
    fill_in "Loan", with: @approval.loan_id
    click_on "Update Approval"

    assert_text "Approval was successfully updated"
    click_on "Back"
  end

  test "destroying a Approval" do
    visit approvals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Approval was successfully destroyed"
  end
end
