class WelcomeController < ApplicationController
  def index
    fill_posters
  end

  def about
    fill_posters
  end

  def contact
    fill_posters
  end

  private

  def fill_posters
    @posters = Poster.scoped
  end
end
