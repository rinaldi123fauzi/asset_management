require "application_system_test_case"

class ContactsTest < ApplicationSystemTestCase
  setup do
    @contact = contacts(:one)
  end

  test "visiting the index" do
    visit contacts_url
    assert_selector "h1", text: "Contacts"
  end

  test "creating a Contact" do
    visit contacts_url
    click_on "New Contact"

    fill_in "Categories", with: @contact.categories_id
    fill_in "Cluster", with: @contact.cluster
    fill_in "Emaiil pic", with: @contact.emaiil_pic
    fill_in "Jabatan pic", with: @contact.jabatan_pic
    fill_in "Keterangan", with: @contact.keterangan
    fill_in "Kontak pic", with: @contact.kontak_pic
    fill_in "Lokasi kerja", with: @contact.lokasi_kerja
    fill_in "Nama entitas", with: @contact.nama_entitas
    fill_in "Nama pic", with: @contact.nama_pic
    fill_in "Satuan kerja", with: @contact.satuan_kerja
    click_on "Create Contact"

    assert_text "Contact was successfully created"
    click_on "Back"
  end

  test "updating a Contact" do
    visit contacts_url
    click_on "Edit", match: :first

    fill_in "Categories", with: @contact.categories_id
    fill_in "Cluster", with: @contact.cluster
    fill_in "Emaiil pic", with: @contact.emaiil_pic
    fill_in "Jabatan pic", with: @contact.jabatan_pic
    fill_in "Keterangan", with: @contact.keterangan
    fill_in "Kontak pic", with: @contact.kontak_pic
    fill_in "Lokasi kerja", with: @contact.lokasi_kerja
    fill_in "Nama entitas", with: @contact.nama_entitas
    fill_in "Nama pic", with: @contact.nama_pic
    fill_in "Satuan kerja", with: @contact.satuan_kerja
    click_on "Update Contact"

    assert_text "Contact was successfully updated"
    click_on "Back"
  end

  test "destroying a Contact" do
    visit contacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contact was successfully destroyed"
  end
end
