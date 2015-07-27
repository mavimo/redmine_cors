module RedmineCors
  module Patches
    module ApplicationController
      def self.included(base) # :nodoc:
        base.class_eval do
          after_filter :cors_set_access_control_headers
        end

        base.send(:include, InstanceMethods)
      end

      module InstanceMethods
        def cors_set_access_control_headers
          allowed_origins = Setting.plugin_redmine_cors["cors_domain"].to_s.downcase.split(/[ ,]/).reject { |c| c.empty? }
          if not request.headers["Origin"].nil?
            if allowed_origins.include?("*") || allowed_origins.include?(request.headers["Origin"].to_s.downcase)
              headers['Access-Control-Allow-Origin'] = request.headers["Origin"].to_s
              if (Setting.plugin_redmine_cors["cors_credentials"] == '1')
                headers['Access-Control-Allow-Credentials'] = 'true'
              end
            end
            headers['Vary'] = 'Origin'
          end
        end
      end
    end
  end
end
