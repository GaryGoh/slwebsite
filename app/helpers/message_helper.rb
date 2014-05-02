module MessageHelper
  def messages_count
    pluralize(Message.count, "message")
  end
end
