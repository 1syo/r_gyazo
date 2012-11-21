class ImagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create
  before_filter :verify_rgyazo_id, only: :create

  def show
    @image = Image.find_by_name(params[:name])
    send_data @image.data, type: @image.content_type, disposition: 'inline'
  end

  def create
    @importer = ImageUploader.new(params[:imagedata])
    @image = Image.new(data: @importer.origin)

    if @image.save
      redirect_to image_url(name: @image.name, format: @image.format)
    else
      redirect_to error_404_url
    end
  end

  private
  def verify_rgyazo_id
    raise Forbidden unless params[:id]
    raise Forbidden unless params[:id] == configatron.rgyazo_id
  end
end
