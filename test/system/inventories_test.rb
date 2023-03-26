require "application_system_test_case"

class InventoriesTest < ApplicationSystemTestCase
  setup do
    @inventory = inventories(:one)
  end

  test "visiting the index" do
    visit inventories_url
    assert_selector "h1", text: "Inventories"
  end

  test "creating a Inventory" do
    visit inventories_url
    click_on "New Inventory"

    fill_in "Harga perolehan", with: @inventory.harga_perolehan
    fill_in "Item", with: @inventory.item_id
    fill_in "Kode", with: @inventory.kode
    fill_in "Kondisi", with: @inventory.kondisi
    fill_in "Lama pakai", with: @inventory.lama_pakai
    fill_in "Lokasi", with: @inventory.lokasi
    fill_in "Masa guna", with: @inventory.masa_guna
    fill_in "Merek", with: @inventory.merek
    fill_in "Nilai residu", with: @inventory.nilai_residu
    fill_in "Tahun perolehan", with: @inventory.tahun_perolehan
    fill_in "User", with: @inventory.user_id
    click_on "Create Inventory"

    assert_text "Inventory was successfully created"
    click_on "Back"
  end

  test "updating a Inventory" do
    visit inventories_url
    click_on "Edit", match: :first

    fill_in "Harga perolehan", with: @inventory.harga_perolehan
    fill_in "Item", with: @inventory.item_id
    fill_in "Kode", with: @inventory.kode
    fill_in "Kondisi", with: @inventory.kondisi
    fill_in "Lama pakai", with: @inventory.lama_pakai
    fill_in "Lokasi", with: @inventory.lokasi
    fill_in "Masa guna", with: @inventory.masa_guna
    fill_in "Merek", with: @inventory.merek
    fill_in "Nilai residu", with: @inventory.nilai_residu
    fill_in "Tahun perolehan", with: @inventory.tahun_perolehan
    fill_in "User", with: @inventory.user_id
    click_on "Update Inventory"

    assert_text "Inventory was successfully updated"
    click_on "Back"
  end

  test "destroying a Inventory" do
    visit inventories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inventory was successfully destroyed"
  end
end
