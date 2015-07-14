class ApplicationController < ActionController::Base
  include ColorgyDeviseSSOManager
  include FlashMessageReporter

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  if ENV['DISABLE_SSO'] == 'true'
    before_filter :sso_off!
  end
end
