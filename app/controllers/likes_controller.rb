class LikesController < ApplicationController
  def create
    current_user.like(shout)
    redirect_to root_url
  end

  def destroy
    current_user.unlike(shout)
    redirect_to root_url
  end

  private

  def shout
    @_shout ||= Shout.find(params[:id])
  end
end