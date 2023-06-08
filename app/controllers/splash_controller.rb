class SplashController < ApplicationController
  skip_before_action :authenticate_user!
  # layout 'splash'

  def index
    redirect_to groups_path if current_user
  end
end
