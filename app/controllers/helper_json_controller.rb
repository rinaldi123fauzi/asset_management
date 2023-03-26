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

    def approve
        @data = Loan.update(params[:id], {:status => params[:status]})
        @checkParent = Loan.find(params[:id])
        @checkStock = Stock.find_by_tool_id(@checkParent.tool_id)
        @amount = @checkStock.jumlah - @checkParent.jumlah 
        @checkStock.update(jumlah: @amount)
        if @data
            render json: [  
                "status" => "terupdate",
            ]
        end
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
        @checkStock = Stock.find_by_tool_id(@checkParent.tool_id)
        @amount = @checkStock.jumlah + @checkParent.jumlah 
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
            "alat" => @data.tool.try(:nama),
            "software" => @data.software.try(:nama),
            "deskripsi" => @data.deskripsi,
            "jumlah" => @data.jumlah,
            "from_date" => @data.from_date,
            "to_date" => @data.to_date,
            "penanggung_jawab" => @data.penanggung_jawab,
            "status" => @data.status
        ]
    end
    # def searchDataDashboard
    #     area = params[:area]
    #     tahun = params[:tahun]
    #     material = params[:material]
    #     if area.present? and tahun.present? and material.present?
    #         bulan = ['01','02','03','04','05','06','07','08','09','10','11','12']
    #         array_response = []
    #         @getData = AdjustmentJob.left_outer_joins(:master_job).select('adjustment_jobs.total_harga as total_harga_yee').where('master_jobs.area_id = ?', area).where('extract(year from master_jobs.tanggal_pekerjaan) = ?', tahun).where('extract(month from master_jobs.tanggal_pekerjaan) IN (?)', bulan).where('nilai_material = ?', material)
    #         @getData.each do |data|
    #             array_response.push(
    #                 "total_harga" => data.total_harga_yee
    #             )
    #         end
    #         render json: [  
    #             "data_dashboard" => array_response
    #         ]
    #     else
    #         bulan = ['01','02','03','04','05','06','07','08','09','10','11','12']
    #         array_response = []
    #         @year = Date.today.year
    #         @getData = AdjustmentJob.left_outer_joins(:master_job).select('adjustment_jobs.total_harga as total_harga_yee').where('extract(year from master_jobs.tanggal_pekerjaan) = ?', @year).where('extract(month from master_jobs.tanggal_pekerjaan) IN (?)', bulan)
    #         @getData.each do |data|
    #             array_response.push(
    #                 "total_harga" => data.total_harga_yee
    #             )
    #         end
    #         render json: [  
    #             "data_dashboard" => array_response,
    #             "year" => @year
    #         ]
    #     end
    # end
end