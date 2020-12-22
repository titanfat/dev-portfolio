class ApplicationController < ActionController::Base
  include DeviseWhiteList
  protect_from_forgery with: :exception

end
