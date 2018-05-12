module Admin
  class ArticlesController < ApplicationController
    load_and_authorize_resource
    before_filter :set_article, only: [:show, :edit, :update, :destroy]
    cache_sweeper :article_sweeper, :only => [:create, :update, :destroy]

    respond_to :html

    def index
      @articles = material.articles
    end

    def show
    end

    def new
      @article = material.articles.new
    end

    def edit
    end

    def create
      @article = material.articles.create(params[:article])
      redirect_to admin_cast_material_articles_url(cast, material)
    end

    def update
      @article.update_attributes(params[:article])
      redirect_to admin_cast_material_articles_url(cast, material)
    end

    def destroy
      @article.destroy
      redirect_to admin_cast_material_articles_url(cast, material)
    end

    private
    def set_article
      @article = Article.find(params[:id])
    end

    helper_method :cast
    def cast
      @cast ||= Cast.find_by_id(params[:cast_id])
    end

    helper_method :material
    def material
      @material ||= Material.find_by_id(params[:material_id])
    end
  end
end
