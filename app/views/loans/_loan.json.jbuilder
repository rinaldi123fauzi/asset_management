json.extract! loan, :id, :user_id, :software_id, :tool_id, :deskripsi, :jumlah, :from_date, :to_date, :penanggung_jawab, :status, :created_at, :updated_at
json.url loan_url(loan, format: :json)
