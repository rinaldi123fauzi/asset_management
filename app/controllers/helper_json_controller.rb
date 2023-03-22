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