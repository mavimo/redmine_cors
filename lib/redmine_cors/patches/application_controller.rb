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
          allowed_origins = Setting.plugin_redmine_cors["cors_domain"].downcase.split(" ,")
          if allowed_origins.include? request.headers["Origin"].downcase
            headers['Access-Control-Allow-Origin'] = request.headers["Origin"]
            headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT'
            headers['Access-Control-Max-Age'] = "1728000"
          end
          headers['Vary'] = 'Origin'
        end
      end
    end
  end
end
