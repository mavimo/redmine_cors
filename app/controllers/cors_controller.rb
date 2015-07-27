class CorsController < ApplicationController
  skip_before_filter :session_expiration, :user_setup, :check_if_login_required, :set_localization

  def preflight
    allowed_origins = Setting.plugin_redmine_cors["cors_domain"].to_s.downcase.split(/[ ,]/).reject { |c| c.empty? }
    if not request.headers["Origin"].nil?
        if allowed_origins.include?("*") || allowed_origins.include?(request.headers["Origin"].to_s.downcase)
            headers['Access-Control-Allow-Origin'] = request.headers["Origin"].to_s
            headers['Access-Control-Allow-Methods'] = Setting.plugin_redmine_cors["cors_methods"]
            headers['Access-Control-Allow-Headers'] = Setting.plugin_redmine_cors["cors_headers"]
            headers['Access-Control-Max-Age'] = Setting.plugin_redmine_cors["cors_maxage"]
            if (Setting.plugin_redmine_cors["cors_credentials"] == '1')
              headers['Access-Control-Allow-Credentials'] = 'true'
            end
        end
    end
    headers['Vary'] = 'Origin'
    render :text => '', :content_type => 'text/plain'
  end
end
