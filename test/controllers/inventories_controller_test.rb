require 'test_helper'

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory = inventories(:one)
  end

  test "should get index" do
    get inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_inventory_url
    assert_response :success
  end

  test "should create inventory" do
    assert_difference('Inventory.count') do
      post inventories_url, params: { inventory: { harga_perolehan: @inventory.harga_perolehan, item_id: @inventory.item_id, kode: @inventory.kode, kondisi: @inventory.kondisi, lama_pakai: @inventory.lama_pakai, lokasi: @inventory.lokasi, masa_guna: @inventory.masa_guna, merek: @inventory.merek, nilai_residu: @inventory.nilai_residu, tahun_perolehan: @inventory.tahun_perolehan, user_id: @inventory.user_id } }
    end

    assert_redirected_to inventory_url(Inventory.last)
  end

  test "should show inventory" do
    get inventory_url(@inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_url(@inventory)
    assert_response :success
  end

  test "should update inventory" do
    patch inventory_url(@inventory), params: { inventory: { harga_perolehan: @inventory.harga_perolehan, item_id: @inventory.item_id, kode: @inventory.kode, kondisi: @inventory.kondisi, lama_pakai: @inventory.lama_pakai, lokasi: @inventory.lokasi, masa_guna: @inventory.masa_guna, merek: @inventory.merek, nilai_residu: @inventory.nilai_residu, tahun_perolehan: @inventory.tahun_perolehan, user_id: @inventory.user_id } }
    assert_redirected_to inventory_url(@inventory)
  end

  test "should destroy inventory" do
    assert_difference('Inventory.count', -1) do
      delete inventory_url(@inventory)
    end

    assert_redirected_to inventories_url
  end
end
