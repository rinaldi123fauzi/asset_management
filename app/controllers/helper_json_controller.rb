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

    def simpanVendor
        Vendor.create!(
            'nama' => params[:namaVendor],
            'alamat' => params[:alamat],
            'kategori' => params[:kategori]
        )
        render json: [  
                        "status" => "tersimpan"
        ]
    end

    def updateVendor
        @data = Vendor.update(params[:id_vendor],
            {
                :nama => params[:namaVendor],
                :alamat => params[:alamat],
                :kategori => params[:kategori]
            }
        )
        if (@data)
            render json: [  
                "status" => "tersimpan",
                "vendor" => params[:namaVendor]
            ]
        end
    end

    def getDetailVendor
        @data = Vendor.find(params[:id])
        render json:[
            "nama" => @data.nama,
            "alamat" => @data.alamat,
            "kategori" => @data.kategori
        ]
    end

    def getAllVendor
        @data = Vendor.all()
        render json:[
            "vendor" => @data
        ]
    end

    def getAllSatker
        @data = WorkUnit.all()
        render json:[
            "satker" => @data
        ]
    end

    def getAllTool
        @data = Tool.all()
        render json:[
            "tools" => @data
        ]
    end

    def simpanAlat
        Tool.create!(
            'nama' => params[:namaAlat],
            'nomor_serial' => params[:nomorSerial],
            'kategori' => params[:kategori],
            'sifat' => params[:sifat],
            'vendor_id' => params[:vendor]
        )
        render json: [  
            "status" => "tersimpan"
        ]
    end

    def simpanStock
        Stock.create!(
            'tool_id' => params[:namaAlat],
            'status' => params[:status],
            'jumlah' => params[:jumlah]
        )
        render json: [  
            "status" => "tersimpan"
        ]
    end

    def updateStock
        @data = Stock.update(params[:id_stock],
            {
                :tool_id => params[:namaAlat],
                :jumlah => params[:jumlah],
                :status => params[:status]
            }
        )

        if (@data)
            render json: [  
                "status" => "tersimpan"
            ]
        end
    end

    def getDetailStock
        @data = Stock.find(params[:id])
        @tools = Tool.all()
        render json: [
            "stock" => @data,
            "tools" => @tools
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

    def getDetailAlat
        @data = Tool.find(params[:id])
        @vendor = Vendor.all()
        render json:[
            "tool" => @data,
            "vendor" => @vendor
        ]
    end

    def simpanSoftware
        @data = Software.create!(
            'nama' => params[:namaSoftware],
            'nomor_serial' => params[:nomorSerial],
            'kategori' => params[:kategori],
            'license_by' => params[:licenseBy],
            'expired_date' => params[:expiredDate],
            'vendor_id' => params[:vendor]
        )
        if (@data)
            render json: [  
                "status" => "tersimpan"
            ]
        end
    end

    def getDetailSoftware
        @data = Software.find(params[:id])
        @vendor = Vendor.all()
        render json:[
            "software" => @data,
            "vendor" => @vendor
        ]
    end

    def updateSoftware
        @data = Software.update(params[:id_software],
            {
                :nama => params[:namaSoftware],
                :nomor_serial => params[:nomorSerial],
                :kategori => params[:kategori],
                :license_by => params[:licenseBy],
                :expired_date => params[:expiredDate],
                :vendor_id => params[:vendor]
            }
        )
        if (@data)
            render json: [  
                "status" => "tersimpan"
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

    def hapusAlat
        @data = Tool.find(params[:id]).destroy
        if (@data)
            render json: [  
                "status" => "terhapus",
            ]
        end
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