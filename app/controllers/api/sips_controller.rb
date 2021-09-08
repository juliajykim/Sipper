class Api::SipsController < ApplicationController
  def index
    @sips = Sip.all.includes(:author)
    render :index
  end

  def create
    @sip = Sip.new(sip_params)
    @sip.author = User.first

    if @sip.save
      render :show
    else
      render json: @sip.errors.full_messages, status: 422
    end
  end

  def show
    @sip = Sip.find_by(id: params[:id])
    render :show
  end
end
