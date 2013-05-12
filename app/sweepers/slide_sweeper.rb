class SlideSweeper < ActionController::Caching::Sweeper
  observe Slide

  def after_save(slide)
    expire_cache_for(slide)
  end

  def after_destroy(slide)
    expire_cache_for(slide)
  end

  private

  def expire_cache_for(slide)
    expire_fragment "slide##{slide.id}"
    expire_fragment "slide_partial##{slide.id}"
  end
end