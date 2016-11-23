class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to new_profile_path if !current_user.profile.present?
    end
  end
end
