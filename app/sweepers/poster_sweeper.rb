class PosterSweeper < ActionController::Caching::Sweeper
  observe Poster

  def after_save(poster)
    expire_cache_for(poster)
  end

  private

  def expire_cache_for(poster)
    expire_fragment('poster_partial')
  end
end