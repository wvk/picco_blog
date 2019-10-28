module PiccoBlog
  class ApplicationController < ::ActionController::Base
    layout PiccoBlog.layout

    protected

    helper_method :current_url, :back_or_default

    def current_url
      request.url
    end

    def back_or_default(default_path)
      params[:referrer] || default_path
    end
  end
end
