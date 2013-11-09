json.array!(@users) do |user|
  json.extract! user, :stuid, :email, :password_digest, :name, :gender, :contact, :department, :proverb, :admin
  json.url user_url(user, format: :json)
end
