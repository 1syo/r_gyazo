class AdminController < ApplicationController
  before_filter :digest_authenticate
  before_filter :find_image, only: [:show, :destroy]

  def index
    @images = Image.order("created_at DESC").page(params[:page])
  end

  def destroy
    @image.destroy
    redirect_to admin_index_url, notice: 'destroy sucess'
  end

  private
  def find_image
    @image = Image.find(params[:id])
  end

  def digest_authenticate
    admin = {configatron.admin.name => configatron.admin.password}
    authenticate_or_request_with_http_digest do |admin_name|
      admin[admin_name]
    end
  end
end
