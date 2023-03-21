require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { categories_id: @contact.categories_id, cluster: @contact.cluster, emaiil_pic: @contact.emaiil_pic, jabatan_pic: @contact.jabatan_pic, keterangan: @contact.keterangan, kontak_pic: @contact.kontak_pic, lokasi_kerja: @contact.lokasi_kerja, nama_entitas: @contact.nama_entitas, nama_pic: @contact.nama_pic, satuan_kerja: @contact.satuan_kerja } }
    end

    assert_redirected_to contact_url(Contact.last)
  end

  test "should show contact" do
    get contact_url(@contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_url(@contact)
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { categories_id: @contact.categories_id, cluster: @contact.cluster, emaiil_pic: @contact.emaiil_pic, jabatan_pic: @contact.jabatan_pic, keterangan: @contact.keterangan, kontak_pic: @contact.kontak_pic, lokasi_kerja: @contact.lokasi_kerja, nama_entitas: @contact.nama_entitas, nama_pic: @contact.nama_pic, satuan_kerja: @contact.satuan_kerja } }
    assert_redirected_to contact_url(@contact)
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact)
    end

    assert_redirected_to contacts_url
  end
end
