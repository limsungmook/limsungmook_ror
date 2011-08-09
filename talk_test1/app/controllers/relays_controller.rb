class RelaysController < ApplicationController
  def create
    @talk = Talk.find(params[:talk_id])
    @relay = @talk.relays.create(params[:relay])
    redirect_to talk_path(@talk)
  end

  def destroy
    @talk = Talk.find(params[:talk_id])
    @relay = @talk.relay.find(params[:id])
    @relay.destroy
    redirect_to talk_path(@talk)
  end
end
