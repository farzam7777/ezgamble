ActiveAdmin.register Review do
  permit_params :title, :content, :user_id, :site_id
end
