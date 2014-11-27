class FaqController < ApplicationController
  layout "index"

  def faq
    @faqs = Faq.all
    @faq = Faq.find_by(params[:id])

  end

end
