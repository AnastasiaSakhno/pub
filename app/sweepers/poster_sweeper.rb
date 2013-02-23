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
    expire_page(:controller => 'posters', :action => 'index')
    expire_fragment('poster_partial')
  end
end