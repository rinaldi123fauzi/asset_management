require "application_system_test_case"

class McusTest < ApplicationSystemTestCase
  setup do
    @mcu = mcus(:one)
  end

  test "visiting the index" do
    visit mcus_url
    assert_selector "h1", text: "Mcus"
  end

  test "creating a Mcu" do
    visit mcus_url
    click_on "New Mcu"

    fill_in "Alergi", with: @mcu.alergi
    fill_in "Berat", with: @mcu.berat
    fill_in "Exp date", with: @mcu.exp_date
    check "Gigi palsu" if @mcu.gigi_palsu
    fill_in "Gol darah", with: @mcu.gol_darah
    check "Kontak lensa" if @mcu.kontak_lensa
    fill_in "Start date", with: @mcu.start_date
    fill_in "Tinggi", with: @mcu.tinggi
    fill_in "Worker", with: @mcu.worker_id
    click_on "Create Mcu"

    assert_text "Mcu was successfully created"
    click_on "Back"
  end

  test "updating a Mcu" do
    visit mcus_url
    click_on "Edit", match: :first

    fill_in "Alergi", with: @mcu.alergi
    fill_in "Berat", with: @mcu.berat
    fill_in "Exp date", with: @mcu.exp_date
    check "Gigi palsu" if @mcu.gigi_palsu
    fill_in "Gol darah", with: @mcu.gol_darah
    check "Kontak lensa" if @mcu.kontak_lensa
    fill_in "Start date", with: @mcu.start_date
    fill_in "Tinggi", with: @mcu.tinggi
    fill_in "Worker", with: @mcu.worker_id
    click_on "Update Mcu"

    assert_text "Mcu was successfully updated"
    click_on "Back"
  end

  test "destroying a Mcu" do
    visit mcus_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mcu was successfully destroyed"
  end
end
