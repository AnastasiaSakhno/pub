class WelcomeController < ApplicationController
  #load_and_authorize_resource

  def index
    @posters = Poster.scoped
  end
end
