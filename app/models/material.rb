class Material < ActiveRecord::Base
  #has_attached_file :document, :default_url => "/images/:style/missing.png"
  #attr_writer :remove_document
  #before_save :before_save_callback
  ##has_attached_file :document,  :default_url => "/images/:style/missing"
  #
  #
  #attr_accessor :document_file_name
  #attr_accessor :document_content_type
  #attr_accessor :document_file_size
  #attr_accessor :document_updated_at
  #
  #validates_attachment_presence :document
  #
  #validates_attachment_content_type :document, :content_type => ['application/pdf', 'application/doc', 'application/docx', 'application/xls', 'application/xlsx']
  #


  has_attached_file :document, :default_url => "/document/:style/missing.pdf"
  attr_writer :remove_document
  before_save :before_save_callback

  validates_attachment :document, :presence => true,
                       :size => {:in => 1..10000.kilobytes}


  def remove_document
    @remove_document || false
  end

  def before_save_callback
    if self.remove_document
      self.remove_document=nil
    end
  end

end
