module Admin
  class CastsController < ApplicationController
    before_filter :set_cast, only: [:show, :edit, :update, :destroy]

    respond_to :html

    def index
      @casts = Cast.all
    end

    def show
    end

    def new
      @cast = Cast.new
    end

    def edit
    end

    def create
      @cast = Cast.new(params[:cast])
      @cast.save
      redirect_to admin_cast_path(@cast)
    end

    def update
      @cast.update_attributes(params[:cast])
      redirect_to admin_cast_path(@cast)
    end

    def destroy
      @cast.destroy
      redirect_to admin_casts_path
    end

    private
      def set_cast
        @cast = Cast.find(params[:id])
      end
  end
end