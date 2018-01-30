class ShoutsController < ApplicationController
  def show
    @shout = Shout.find(params[:id])
  end

  def create
    shout = current_user.shouts.create(shout_params)
    redirect_to root_url, redirect_options_for(shout)
  end

  private

  def shout_params
    params.require(:shout).permit(:body)
  end

  def redirect_options_for(shout)
    if shout.persisted?
      { notice: 'Shout successful' }
    else
      { alert: 'Could not shout' }
    end
  end
end

