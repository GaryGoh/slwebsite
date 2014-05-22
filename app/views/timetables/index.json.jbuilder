json.array!(@timetables) do |timetable|
  json.extract! timetable, 
  json.url timetable_url(timetable, format: :json)
end
