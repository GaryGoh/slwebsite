ActiveAdmin.register Faq do

  permit_params :query, :answer
  actions :all
  menu :label => "FAQ",
       :if => proc{ can?(:manage, Faq) }


  index do
    selectable_column
    column :query
    column :created_at
    default_actions
  end

  # The form is to create society info
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "FAQ" do
      f.input :query
      f.input :answer
    end
    f.actions
  end

  filter :query
  filter :answer
  filter :created_at
  
end
