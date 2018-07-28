class MenuPageSweeper < ActionController::Caching::Sweeper
  observe MenuPage

  def after_save(menu_page)
    expire_cache_for(menu_page)
  end

  def after_destroy(menu_page)
    expire_cache_for(menu_page)
  end

  private

  def expire_cache_for(menu_page)
    expire_fragment "menu_page_image##{menu_page.id}"
  end
end