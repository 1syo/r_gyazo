ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Images" do
          ul do
            Image.order("created_at desc").limit(5).map do |image|
              li link_to(image_path(only_path: false, name: image.name, format: image.format), admin_image_path(image))
            end
          end
        end
      end
    end
  end # content
end
