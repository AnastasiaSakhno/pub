class ArticleSweeper < ActionController::Caching::Sweeper
  observe Article

  def after_save(article)
    expire_cache_for(article)
  end

  def after_destroy(article)
    expire_cache_for(article)
  end

  private

  def expire_cache_for(article)
    expire_fragment "article_image##{article.id}"
  end
end