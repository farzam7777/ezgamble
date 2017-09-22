ActiveAdmin.register Site do
  permit_params :link, :description, :category_id
end
