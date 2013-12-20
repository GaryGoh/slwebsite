class MaterialController < ApplicationController
  def download
    #  @material = Material.find(params[:id])
    #  file_path = @material.document_file_name
    #  if !file_path.nil?
    #    send_file "#{Rails.root}/public/system/documents/#{@material.id}/original/#{file_path}", :x_sendfile => true
    #  else
    #    redirect_to download_url, :notice => "下载失败"
    #  end
    #end
    @materials = Material.all.reverse

  end
end
