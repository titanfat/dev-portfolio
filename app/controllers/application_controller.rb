class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_title, :set_copyright
  include DeviseWhitelist
  include SetSource
  include CurrentUser

  def set_copyright
    @copyright = ViewTool::Renderer.copyright 'Andrew Titov',
                                              'All rights reserved'
  end

  def set_title
    @page_title = "Andrew Titov Developer| My Portfolio Website"
    @seo_keywords = "Andrew Titov portfolio"
  end
end

  module ViewTool
    class Renderer
      def self.copyright name, msg
        "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
      end
    end
  end