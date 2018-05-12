module Admin
  class MaterialsController < ApplicationController
    before_filter :set_material, only: [:show, :edit, :update, :destroy]

    respond_to :html, :js

    def index
      if params[:cast_id]
        @cast = Cast.find_by_id(params[:cast_id])
        @materials = @cast.try(:materials)
      end
    end

    def show
    end

    def new
      @cast = Cast.find(params[:cast_id])
      @material = @cast.materials.build
    end

    def edit
    end

    def create
      @cast = Cast.find(params[:cast_id])
      @material = @cast.materials.create(params[:material])
      redirect_to admin_cast_materials_url(@cast)
    end

    def update
      @material.update_attributes(params[:material])
      redirect_to admin_cast_materials_url(@cast.id)
    end

    def destroy
      @material.destroy
      redirect_to admin_cast_materials_path(@cast)
    end

    private

    def set_material
      @cast = Cast.find(params[:cast_id])
      @material = @cast.materials.find(params[:id])
    end
  end
end