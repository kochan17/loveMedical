class LovesController < ApplicationController
  def new
    @love = Love.new
  end

  def show
    @love = Love.find(params[:id])
  end

  def create
    @love = Love.new(love_params)
    if @love.save
      redirect_to @love
    else
      render :new
    end
  end
  

  private

  def love_params
    params.require(:love).permit(:personality, :occupation, :favorite_food, :birthday, :background, :ideal_partner)
  end
end
