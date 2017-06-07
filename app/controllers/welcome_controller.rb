class WelcomeController < ApplicationController
  def index
      if (current_user)
          redirect_to 'contacts#index'
      end
  end
end
