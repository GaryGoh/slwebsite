class Faq < ActiveRecord::Base
  has_many :sub_faqs, :dependent => :destroy

  validates :query, presence: true
  validates :answer, presence: true

  def to_s
    self.query
  end

end
