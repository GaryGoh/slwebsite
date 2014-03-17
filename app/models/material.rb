class Material < ActiveRecord::Base
  has_attached_file :document
  attr_writer :remove_document
  before_save :before_save_callback

  validates_attachment_presence :document

  validates_attachment :document, :presence => true,
                       :size => {:in => 1..10000.kilobytes}

  validates_attachment_content_type :document,
                                    :content_type => ['application/pdf', 'application/msword',
                                                      ' application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                                                      'application/msexcel', 'application/vnd.ms-excel',
                                                      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                                                      'application/mspowerpoint', 'application/vnd.ms-powerpoint',
                                                      'application/vnd.openxmlformats-officedocument.presentationml.presentation', 'text/plain'],
                                    :message => ' 只支持 "pdf, doc, docx, xls, xlsx, ppt, pptx, txt" 文件'
  #validates_format_of :document, :with => /\.(?:doc|pdf)$/i, :multiline => true


  def remove_document
    @remove_document || false
  end

  def before_save_callback
    if self.remove_document
      self.remove_document=nil
    end
  end

end
