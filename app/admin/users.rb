ActiveAdmin.register User do
  permit_params :email, :username, :image, :password, :password_confirmation
  
  filter :username
  filter :email
  
  form multipart: true do |f|
    f.inputs "User Details" do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :image, :as => :file, :hint => f.object.image.present? \
      ? image_tag(f.object.image.url(:medium))
      : content_tag(:span, "no preview yet") 
    end
    f.button :Submit
  end
end
