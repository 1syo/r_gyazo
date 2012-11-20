class ImageUploader
  def initialize(param)
    @param = param
  end

  def origin
    open(path, "rb").read
  end

  def path
    @param.path rescue @param.tempfile.path
  end
end
