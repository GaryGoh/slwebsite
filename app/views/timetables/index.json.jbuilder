json.array!(@timetables) do |timetable|
  json.extract! timetable, :user_id, :start_time, :end_time, :title, :content, :location
  json.url timetable_url(timetable, format: :json)
end
