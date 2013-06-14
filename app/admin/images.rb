ActiveAdmin.register Image do
  actions  :index, :show, :destroy
  config.per_page = 10
  filter :created_at

  index download_links: false do
    column :image, sortable: 'name' do |image|
      link_to(image_path(only_path: false, name: image.name, format: image.format), admin_image_path(image))
    end
    column :created_at
    column "Action" do |image|
      link_to "Delete", admin_image_path(image), method: :delete, 'data-confirm' => "Are you sure you want to delete this?"
    end
  end

  show title: proc { |image| image_path(only_path: false, name: image.name, format: image.format) } do
    div do
      image_tag(image_path(only_path: false, name: image.name, format: image.format))
    end
    div do
      image.created_at
    end
  end

  action_item :only => :show do
    link_to('Listing Images', admin_images_path)
  end
end
