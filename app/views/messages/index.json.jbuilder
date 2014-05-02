json.array!(@messages) do |message|
  json.extract! message, :user_id, :msg_content, :msg_font, :msg_position
  json.url message_url(message, format: :json)
end
