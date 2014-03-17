class SubFaq < ActiveRecord::Base
  belongs_to :faq

  validates :query, presence: true
  validates :answer, presence: true
  validates :faq_id, presence: true


end
