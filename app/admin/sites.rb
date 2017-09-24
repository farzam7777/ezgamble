ActiveAdmin.register Site do
  permit_params :title, :link, :description, :category_id, :preview
  
  index do
    column :category
    column :title
    column :link
    column :description
    column "Preview" do |site|
        image_tag site.preview.url(:thumb)
    end
    actions
  end
  
  form multipart: true do |f|
    f.inputs "Site Details" do
      f.input :category_id, as: :select, collection: Category.all.map{|x| [x.title, x.id]}, include_blank: false
      f.input :title
      f.input :link
      f.input :description  
      f.input :preview, :as => :file, :hint => f.object.preview.present? \
      ? image_tag(f.object.preview.url(:medium))
      : content_tag(:span, "no preview yet") 
    end
    f.button :Submit
  end
  
  show do
    attributes_table do
      row :category
      row :title
      row :link
      row :description
      row :preview do
        image_tag site.preview.url(:medium)
      end
    end
    active_admin_comments
  end
  
  filter :category
  filter :title
end
