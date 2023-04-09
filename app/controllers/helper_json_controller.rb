class HelperJsonController < ApplicationController
    def getSubWorkCategory
        id = params[:id]
        begin
            @dataArray = []
            @subKategori = SubWorkCategory.select(:id, :nama_subkategori).where(work_category_id: id)
            @subKategori.each do |sub_kategori|
                @dataArray.push(
                    "id" => sub_kategori.id,
                    "nama_subkategori" => sub_kategori.nama_subkategori
                )
            end
            render json: ["dataSubKategori" => @dataArray]
        rescue
            render json: { response: "gagal" }
        end
    end

    def getJudulPekerjaan
        id = params[:id]
        begin
            @dataArray = []
            @subKategori = MasterJob.select('DISTINCT ON(judul_pekerjaan) judul_pekerjaan').where(['no_kontrak LIKE ?', "%#{id}%"])
            @subKategori.each do |sub_kategori|
                @dataArray.push(
                    "judul_pekerjaan" => sub_kategori.judul_pekerjaan
                )
            end
            render json: ["dataJudulPekerjaan" => @dataArray]
        rescue
            render json: { response: "gagal" }
        end
    end

    def getNamaPekerjaan
        id = params[:id]
        begin
            @dataArray = []
            @subKategori = MasterJob.where(['judul_pekerjaan LIKE ?', "%#{id}%"])
            @subKategori.each do |sub_kategori|
                @dataArray.push(
                    "id" => sub_kategori.id,
                    "nama_pekerjaan" => sub_kategori.nama_pekerjaan
                )
            end
            render json: ["dataNamaPekerjaan" => @dataArray]
        rescue
            render json: { response: "gagal" }
        end
    end

    def getAllSatker
        @data = WorkUnit.all()
        render json:[
            "satker" => @data
        ]
    end

    def simpanInventory
        ActiveRecord::Base.transaction do
            @simpan = Inventory.new()
            @simpan.kode = params[:kode]
            @simpan.item_id = params[:item]
            @simpan.merek = params[:merek]
            @simpan.tahun_perolehan = params[:tahun_perolehan]
            @simpan.harga_perolehan = params[:harga_perolehan]
            @simpan.nilai_residu = params[:nilai_residu]
            @simpan.masa_guna = params[:masa_guna]
            @simpan.lama_pakai = params[:lama_pakai]
            @simpan.kondisi = params[:kondisi]
            @simpan.lokasi = params[:lokasi]
            if params[:foto_inventory]
                @simpan.foto_inventory = params[:foto_inventory]               
            end
            @simpan.save!
        end
        render json: { 
            "status" => "tersimpan"
        }
    end

    def updateInventory
        ActiveRecord::Base.transaction do
            @update = Inventory.find(params[:id_inventory])
            @data = Inventory.update(params[:id_inventory],
                {
                    :kode => params[:kode],
                    :item_id => params[:item],
                    :merek => params[:merek],
                    :tahun_perolehan => params[:tahun_perolehan],
                    :harga_perolehan => params[:harga_perolehan],
                    :nilai_residu => params[:nilai_residu],
                    :masa_guna => params[:masa_guna],
                    :lama_pakai => params[:lama_pakai],
                    :kondisi => params[:kondisi],
                    :lokasi => params[:lokasi]
                }
            )
            if (params[:foto_inventory])
                @update.update(:foto_inventory => params[:foto_inventory])
            end
        end

        if (@data)
            render json: {
                status: "tersimpan"
            }
        end
    end

    def getDetailInventory
        @data = Inventory.find(params[:id])
        @item = Item.all()
        render json: [
            :kode => @data.kode,
            :item => @data.item_id,
            :nama_item => @data.item.nama_item,
            :merek => @data.merek,
            :tahun_perolehan => @data.tahun_perolehan,
            :harga_perolehan => @data.harga_perolehan,
            :nilai_residu => @data.nilai_residu,
            :masa_guna => @data.masa_guna,
            :lama_pakai => @data.lama_pakai,
            :kondisi => @data.kondisi,
            :lokasi => @data.lokasi,
            'items' => @item
        ]
    end

    def simpanItem
        Item.create!(
            'nama_item' => params[:nama_item],
        )
        flash[:alert] = "created"
        render json: { 
            "status" => "tersimpan"
        }
    end

    def updateItem
        ActiveRecord::Base.transaction do
            @data = Item.update(params[:id_item],
                {
                    :nama_item => params[:nama_item],
                }
            )
        end

        if (@data)
            flash[:alert] = "updated"
            render json: {
                status: "tersimpan"
            }
        end
    end

    def getDetailItem
        @data = Item.find(params[:id])
        render json: [
            "item" => @data.nama_item
        ]
    end

    def getAllItem
        @data = Item.all()
        render json: [
            "item" => @data
        ]
    end

    def updateAlat
        @data = Tool.update(params[:id_alat],
            {
                :nama => params[:namaAlat],
                :nomor_serial => params[:nomorSerial],
                :kategori => params[:kategori],
                :sifat => params[:sifat],
                :vendor_id => params[:vendor]
            }
        )
        if (@data)
            render json: [  
                "status" => "tersimpan",
                "nomor" => params[:nomorSerial]
            ]
        end
    end

    def simpanSatker
        WorkUnit.create!(
            'nama' => params[:namaSatker]
        )
        render json: [  
            "status" => "tersimpan"
        ]
    end

    def updateSatker
        @data = WorkUnit.update(params[:id_satker],
            {
                :nama => params[:namaSatker]
            }
        )
        if (@data)
            render json: [  
                "status" => "tersimpan",
                "satker" => params[:namaSatker]
            ]
        end
    end

    def getDetailSatker
        @data = WorkUnit.find(params[:id])
        render json:[
            "nama" => @data.nama
        ]
    end

    def simpanKaryawan
        Employee.create!(
            id_pegawai: params[:id_pegawai],
            nama: params[:nama_pegawai],
            tempat_lahir: params[:tempat_lahir],
            tanggal_lahir: params[:tanggal_lahir],
            alamat: params[:alamat],
            id_identitas: params[:id_identitas],
            nomor_telepon: params[:nomor_telepon],
            email: params[:email],
            jabatan: params[:jabatan],
            work_unit_id: params[:satker]
        )
        render json: [  
            "status" => "tersimpan",
            "satker" => params[:id_pegawai]
        ]
    end

    def updateKaryawan
        @data = Employee.update(params[:id_karyawan],
            {
                id_pegawai: params[:id_pegawai],
                nama: params[:nama_pegawai],
                tempat_lahir: params[:tempat_lahir],
                tanggal_lahir: params[:tanggal_lahir],
                alamat: params[:alamat],
                id_identitas: params[:id_identitas],
                nomor_telepon: params[:nomor_telepon],
                email: params[:email],
                jabatan: params[:jabatan],
                work_unit_id: params[:satker]
            }
        )
        if (@data)
            render json: [  
                "status" => "tersimpan",
                "satker" => params[:id_pegawai]
            ]
        end
    end

    def getDetailKaryawan
        @data = Employee.find(params[:id])
        @satker = WorkUnit.all()
        render json:[
            "karyawan" => @data,
            "satker" => @satker
        ]
    end

    def hapusKaryawan
        @data = Employee.find(params[:id]).destroy
        if (@data)
            render json: [  
                "status" => "terhapus",
            ]
        end
    end

    def hapusSatker
        @data = WorkUnit.find(params[:id]).destroy
        if (@data)
            render json: [  
                "status" => "terhapus",
            ]
        end
    end

    def checkInventory
        begin
            @data = Inventory.find(params[:id])
            if @data.user_id && @data.lokasi == "dipinjam"
                render json: [  
                    "status" => "sudah dipinjam",
                ]
            else
                render json: [  
                    "status" => "tersedia",
                ]
            end
        rescue
            render json: [  
                "status" => "tersedia",
            ]
        end
    end

    def approve
        @data = Loan.update(params[:id], {:status => params[:status]})
        @checkParent = Loan.find(params[:id])
        Inventory.update(@checkParent.inventory_id, {:user_id => @checkParent.user_id, :lokasi => "dipinjam"})
        render json: [  
            "status" => "terupdate",
        ]
    end

    def reject
        @data = Loan.update(params[:id], {:status => params[:status]})
        if @data
            render json: [  
                "status" => "terupdate",
            ]
        end
    end

    def done
        @data = Loan.update(params[:id], {:status => params[:status]})
        @checkParent = Loan.find(params[:id])
        Inventory.update(@checkParent.inventory_id, {:user_id => "", :lokasi => "kantor"})
        if @data
            render json: [  
                "status" => "terupdate",
            ]
        end
    end

    def getDetailPeminjaman
        @data = Loan.find(params[:id])
        render json:[
            "nama_peminjam" => @data.user.username,
            "deskripsi" => @data.deskripsi,
            "inventory" => @data.inventory.merek,
            "from_date" => @data.from_date,
            "to_date" => @data.to_date,
            "penanggung_jawab" => @data.penanggung_jawab,
            "status" => @data.status
        ]
    end

    def deleteFile
        @attachment = ActiveStorage::Attachment.find(params[:id])
        @attachment.purge # or use purge_later
        if @attachment
            render json: [  
                "status" => "terhapus",
            ]
        end
    end

    def activationUser
        if params[:status] == "1"
            @value = "1"
        elsif params[:status] == "0"
            @value = "0"
        end
        @update = User.update(params[:id], {:state => @value})
        if @update
            render json: [  
                "status" => "terubah",
            ]
        end
    end

    def searchDataDashboard
        tahun = params[:tahun]
        if tahun.present?
            @getDataBaik = Inventory.select('*').where('extract(year from tahun_perolehan) = ?', tahun).where('kondisi = ?', "baik").count
            @getDataDiperbaiki = Inventory.select('*').where('extract(year from tahun_perolehan) = ?', tahun).where('kondisi = ?', "diperbaiki").count
            @getDataDiganti = Inventory.select('*').where('extract(year from tahun_perolehan) = ?', tahun).where('kondisi = ?', "diganti").count
            
            @getDataDipinjam = Inventory.select('*').where('extract(year from tahun_perolehan) = ?', tahun).where('lokasi = ?', "dipinjam").count
            @getDataKantor = Inventory.select('*').where('extract(year from tahun_perolehan) = ?', tahun).where('lokasi = ?', "kantor").count
            @array_response = []
            @array_response1 = []
            @array_response.push(
                "data_baik" => @getDataBaik,
                "data_diperbaiki" => @getDataDiperbaiki,
                "data_diganti" => @getDataDiganti
            )
            @array_response1.push(
                "data_dipinjam" => @getDataDipinjam,
                "data_kantor" => @getDataKantor
            )
            render json: [  
                "data" => @array_response,
                "data_pinjam" => @array_response1,
                "year" => @year
            ]
        else
            bulan = ['01','02','03','04','05','06','07','08','09','10','11','12']
            array_response = []
            @year = Date.today.year
            # @getData = Inventory.select('adjustment_jobs.total_harga as total_harga_yee').where('extract(year from tahun_perolehan) = ?', @year).where('extract(month from master_jobs.tanggal_pekerjaan) IN (?)', bulan)
            @getDataBaik = Inventory.select('*').where('extract(year from tahun_perolehan) = ?', @year).where('kondisi = ?', "baik").count
            @getDataDiperbaiki = Inventory.select('*').where('extract(year from tahun_perolehan) = ?', @year).where('kondisi = ?', "diperbaiki").count
            @getDataDiganti = Inventory.select('*').where('extract(year from tahun_perolehan) = ?', @year).where('kondisi = ?', "diganti").count
            
            @getDataDipinjam = Inventory.select('*').where('extract(year from tahun_perolehan) = ?', @year).where('lokasi = ?', "dipinjam").count
            @getDataKantor = Inventory.select('*').where('extract(year from tahun_perolehan) = ?', @year).where('lokasi = ?', "kantor").count
            @array_response = []
            @array_response1 = []
            @array_response.push(
                "data_baik" => @getDataBaik,
                "data_diperbaiki" => @getDataDiperbaiki,
                "data_diganti" => @getDataDiganti
            )
            @array_response1.push(
                "data_dipinjam" => @getDataDipinjam,
                "data_kantor" => @getDataKantor
            )
            render json: [  
                "data" => @array_response,
                "data_pinjam" => @array_response1,
                "year" => @year
            ]
        end
    end
end