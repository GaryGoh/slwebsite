json.array!(@issues) do |issue|
  json.extract! issue, :title, :content, :date, :user_id
  json.url issue_url(issue, format: :json)
end
