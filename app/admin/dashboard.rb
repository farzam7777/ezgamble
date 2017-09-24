ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
    end
    
    columns do
      column do
        panel "Recent Sites" do
          ul do
            Site.last(5).map do |site|
              li link_to(site.title, admin_site_path(site))
            end
          end
        end
      end
    end
    
    columns do
      column do
        panel link_to('Recent Users', admin_users_path, style: 'color: white; text-decoration: none') do
          ul do
            User.last(5).map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end
    end
    
    columns do
      column do
        panel "Recent Reviews" do
          ul do
            Review.last(5).map do |review|
              li link_to(review.title, admin_review_path(review))
            end
          end
        end
      end
    end
    
  end # content
end
