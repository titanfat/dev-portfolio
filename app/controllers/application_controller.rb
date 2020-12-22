class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_title
  include DeviseWhitelist
  include SetSource
  include CurrentUser

  def set_title
    @page_title = "Andrew Titov Developer| My Portfolio Website"
    @seo_keywords = "Andrew Titov portfolio"
  end
end