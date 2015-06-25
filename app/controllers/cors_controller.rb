class CorsController < ApplicationController
  skip_before_filter :session_expiration, :user_setup, :check_if_login_required, :set_localization

  def preflight
    allowed_origins = Setting.plugin_redmine_cors["cors_domain"].to_s.downcase.split(/[ ,]/).reject { |c| c.empty? }
    if not request.headers["Origin"].nil?
        if allowed_origins.include? request.headers["Origin"].to_s.downcase
            headers['Access-Control-Allow-Origin'] = request.headers["Origin"].to_s
            headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT'
            headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Content-Type, X-Redmine-API-Key, accept, authorization'
            headers['Access-Control-Max-Age'] = "1728000"
        end
    end
    headers['Vary'] = 'Origin'
    render :text => '', :content_type => 'text/plain'
  end
end
