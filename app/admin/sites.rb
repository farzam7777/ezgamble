ActiveAdmin.register Site do
  permit_params :title, :link, :description, :category_id
end
