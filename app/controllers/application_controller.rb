class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_filter  :verify_authenticity_token

def cors_set_access_control_headers
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  headers['Access-Control-Allow-Headers'] = '*'
  headers['Access-Control-Max-Age'] = "1728000"
end
end
