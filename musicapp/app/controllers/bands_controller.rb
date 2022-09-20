class BandsController < ApplicationController

  def index
    @bands = Band.all 
    render :index # Shows all bands
  end

  def create 
    @band = Band.new(band_params)
    if @band.save 
      redirect_to band_url(@band) 
    else 
      flash.now[:errors] = @band.errors.full_messages
      render :new 
    end
  end

  def new
    @band = Band.new
    render :new # Form to create new band
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit # Form to edit band
  end

  def update
    @band = Band.find_by(id: params[:id])

    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show # Show one band
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    @band.destroy
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
