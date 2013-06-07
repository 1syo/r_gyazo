class IndexController < ApplicationController
  def index
    render text: 'index'
  end

  def error_404
  end

  def error_403
  end
end
