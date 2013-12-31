json.array!(@notis) do |noti|
  json.extract! noti, :title, :content, :user_id, :category_id, :society_id, :start_time, :end_time
  json.url noti_url(noti, format: :json)
end
