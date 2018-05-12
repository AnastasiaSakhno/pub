class ArticlesController < ApplicationController
  respond_to :html, :js

  def index
    @cast ||= Cast.find_by_id(params[:cast_id])
    @articles ||= begin
      scoped = Article.scoped
      scoped = scoped.by_cast_id(params[:cast_id]) if params[:cast_id].present?
      scoped = scoped.by_material_name(material_name) if material_name.present?
      scoped = scoped.by_name(params[:name]) if params[:name].present?
      scoped.paginate(page: params[:page], per_page: 6)
    end
  end

  def show
  end

  private

  helper_method :article
  def article
    @article = Article.find(params[:id])
  end

  helper_method :material_name
  def material_name
    params[:cast].try(:[], :material_name)
  end
end
