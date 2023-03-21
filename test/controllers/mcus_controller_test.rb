require 'test_helper'

class McusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mcu = mcus(:one)
  end

  test "should get index" do
    get mcus_url
    assert_response :success
  end

  test "should get new" do
    get new_mcu_url
    assert_response :success
  end

  test "should create mcu" do
    assert_difference('Mcu.count') do
      post mcus_url, params: { mcu: { alergi: @mcu.alergi, berat: @mcu.berat, exp_date: @mcu.exp_date, gigi_palsu: @mcu.gigi_palsu, gol_darah: @mcu.gol_darah, kontak_lensa: @mcu.kontak_lensa, start_date: @mcu.start_date, tinggi: @mcu.tinggi, worker_id: @mcu.worker_id } }
    end

    assert_redirected_to mcu_url(Mcu.last)
  end

  test "should show mcu" do
    get mcu_url(@mcu)
    assert_response :success
  end

  test "should get edit" do
    get edit_mcu_url(@mcu)
    assert_response :success
  end

  test "should update mcu" do
    patch mcu_url(@mcu), params: { mcu: { alergi: @mcu.alergi, berat: @mcu.berat, exp_date: @mcu.exp_date, gigi_palsu: @mcu.gigi_palsu, gol_darah: @mcu.gol_darah, kontak_lensa: @mcu.kontak_lensa, start_date: @mcu.start_date, tinggi: @mcu.tinggi, worker_id: @mcu.worker_id } }
    assert_redirected_to mcu_url(@mcu)
  end

  test "should destroy mcu" do
    assert_difference('Mcu.count', -1) do
      delete mcu_url(@mcu)
    end

    assert_redirected_to mcus_url
  end
end
