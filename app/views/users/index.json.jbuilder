json.array!(@users) do |user|
  json.extract! user, :provider, :uid, :username, :name, :gender, :contact, :department, :proverb
  json.url user_url(user, format: :json)
end
