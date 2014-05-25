ActiveAdmin.register Material do

  permit_params :description, :document, :document_file_name
  actions :all, :except => [:edit, :show]
  menu :label => "资料上传",
       :if => proc { can?(:manage, Material) }


  index do
    selectable_column
    column :description
    column :document_file_name
    column :created_at
    actions
  end

  #form :html => { :enctype => "multipart/form-data" } do |f|
  #  f.inputs "Details" do
  #    f.input :description
  #    f.input :ava_piv, :as => :file, :hint => (f.template.image_tag(f.object.ava_pic.url(:thumb)) unless f.object.new_record?)
  #  end
  #  f.actions
  #end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "文件上传" do
      f.input :description
      f.input :document, :as => :file
    end
    f.actions
  end
  #
  #controller do
  #  def destroy
  #    @home_background = HomeBackground.find(params[:id])
  #    @home_background.ava_pic = nil
  #    @home_background.save
  #    @home_background.destroy
  #  end
  #end


  filter :description
  filter :created_at
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
