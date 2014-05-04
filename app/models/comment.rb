class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue

  def current_toggle_user(comment)
    comment.user
  end


end
