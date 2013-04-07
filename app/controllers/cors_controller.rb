class CorsController < ApplicationController
  skip_before_filter :session_expiration, :user_setup, :check_if_login_required, :set_localization

  def preflight
    headers['Access-Control-Allow-Origin'] = Setting.plugin_redmine_cors["cors_domain"].to_s
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Content-Type, X-Redmine-API-Key'
    headers['Access-Control-Max-Age'] = '1728000'
    render :text => '', :content_type => 'text/plain'
  end
end
