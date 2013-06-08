# RailsAdmin config file. Generated on June 07, 2013 15:29
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['RGyazo', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_administrator } # auto-generated
  config.authenticate_with { authenticate_administrator! }

  # If you want to track changes on your models:
  config.audit_with :history, 'Administrator'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'Administrator'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Administrator', 'Image']

  # Include specific models (exclude the others):
  # config.included_models = ['Administrator', 'Image']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]
  config.actions do
    # root actions
    dashboard
    # collection actions 
    index
    new do
      except Image
    end
    bulk_delete
    # member actions
    show
    edit do
      except Image
    end
    delete
    history_show
  end
end
