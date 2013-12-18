ActiveAdmin.register HomeBackground do

  permit_params :description, :ava_pic
  actions :all, :except => [:edit, :show]
  menu :label => "背景图片",
       :if => proc { can?(:manage, HomeBackground) }


  index do
    selectable_column
    column :description
    column "预览" do |image|
      link_to(image_tag(image.ava_pic.url(:thumb), :height => '100'), image.ava_pic.url(:medium))
    end
    column :created_at
    default_actions
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
    f.inputs "背景图片" do
      f.input :description
      f.input :ava_pic, :as => :file
    end
    f.actions
  end


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
