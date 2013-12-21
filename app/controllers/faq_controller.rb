class FaqController < ApplicationController
  layout "faq"

  def faq
    @faqs = Faq.all
    @faq = Faq.find_by(params[:id])

  end

end
