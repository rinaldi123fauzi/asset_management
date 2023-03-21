module ApplicationHelper
   def getSubKategori(kategori,sub_kategori)
    if kategori.present?
        @receive = SubWorkCategory.where(work_category_id: kategori).order(:id => :asc)
        option = '<option value=""></value>'
        f = {}
        
        @receive.each do |receive|
            f["#{receive.id}"] = "#{receive.nama_subkategori}"
        end 
        f.sort_by { |key| key }
        f.each do |k,v|
        if v.match(/#{sub_kategori}/)
            selected = "selected"
        end
            option = option + '<option value="'+k+'" '+selected.to_s+'>'+v+'</option>'
        end
        
        return option
    end
   end

   def getJudulPekerjaan(no_kontrak, judul_pekerjaan)
    if no_kontrak.present?
        @receive = MasterJob.where(no_kontrak: no_kontrak).order(:id => :asc)
        option = '<option value=""></value>'
        f = {}
        
        @receive.each do |receive|
            f["#{receive.judul_pekerjaan}"] = "#{receive.judul_pekerjaan}"
        end 
        f.sort_by { |key| key }
        f.each do |k,v|
        if v.match(/#{judul_pekerjaan}/)
            selected = "selected"
        end
            option = option + '<option value="'+k+'" '+selected.to_s+'>'+v+'</option>'
        end
        
        return option
    end
   end

   def getNamaPekerjaan(no_kontrak, judul_pekerjaan, master_job_id)
    if no_kontrak.present?
        @receive = MasterJob.where(['no_kontrak LIKE ? and judul_pekerjaan LIKE ?', "%#{no_kontrak}%", "%#{judul_pekerjaan}%"]).order(:id => :asc)
        option = '<option value=""></value>'
        f = {}
        
        @receive.each do |receive|
            f["#{receive.id}"] = "#{receive.nama_pekerjaan}"
        end 
        f.sort_by { |key| key }
        f.each do |k,v|
        if k.match(/#{master_job_id}/)
            selected = "selected"
        end
            option = option + '<option value="'+k+'" '+selected.to_s+'>'+v+'</option>'
        end
        
        return option
    end
   end
end
