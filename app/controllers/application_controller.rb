class ApplicationController < ActionController::Base

    before_action :authenticate_user!

    protect_from_forgery with: :null_session,
      if: Proc.new { |c| c.request.format =~ %r{application/json} }
end
