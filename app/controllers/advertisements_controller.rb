class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new(advertisement_parems)

    if @advertisement.save
      flash[:notice] = "#{@advertisement.title} is created"
      redirect_to @advertisement
    else
      flash.now[:alert] = "There was an error saving the advertisement. Please try again."
      render :new
    end
  end

  private
  def advertisement_parems
    params.require(:advertisement).permit(:title,:copy,:price)
  end
end
