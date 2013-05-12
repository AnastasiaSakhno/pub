class PosterSweeper < ActionController::Caching::Sweeper
  observe Poster

  def after_save(poster)
    expire_cache_for(poster)
  end

  def after_destroy(poster)
    expire_cache_for(poster)
  end

  private

  def expire_cache_for(poster)
    expire_fragment "poster_image##{poster.id}"
  end
end