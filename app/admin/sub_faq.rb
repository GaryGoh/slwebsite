ActiveAdmin.register SubFaq do


  permit_params :query, :answer, :faq_id
  actions :all
  menu :label => "SubFAQ",
       :if => proc { can?(:manage, SubFaq) }


  index do
    selectable_column
    column :query, :label => "子问题"
    column :faq, :label => "主问题"
    column :created_at
    default_actions
  end

  # The form is to create society info
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "SubFAQ" do
      f.input :faq
      f.input :query
      f.input :answer
    end
    f.actions
  end

  filter :faq
  filter :query
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
