class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to docs_path
    end
  end
end
