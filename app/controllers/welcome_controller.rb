class WelcomeController < ApplicationController
  def index
    @posters = Poster.scoped
  end
end
