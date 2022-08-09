class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:redirect]

  def redirect
    redirect_to questions_path
  end

end
