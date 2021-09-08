class SipsController < ApplicationController
  def index
    @sips = Sip.all #fetch all sips
    # render json: @sips #renders sips in body of response as JSON
    render :index 
  end

  def show
    @sip = Sip.find(params[:id])
    render json: @sip
  end

  def create
    @sip = Sip.new(sip_params) # don't yet want to save to db
    # @sip.author_id = User.first.id # does same thing as below
    @sip.author = User.first

    if @sip.save # returns boolean // save! errors out if not successful
      # redirect_to sip_url(@sip.id)
      redirect_to sip_url(@sip) # will extract the id for us
      # ^will create a new request with redirects
    else
      render json: @sip.errors.full_messages, status: 422 #unprocessable entity
      # present errors messages to user
    end
  end

  def update
    @sip = Sip.find(params[:id])

    if @sip.update(sip_params)
      redirect_to sip_url(@sip)
    else
      render json: @sip.errors.full_messages, status: 422
      # render json: @sip.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @sip = Sip.find(params[:id])
    @sip.destroy
    redirect_to sips_url
  end

  private

  def sip_params
    params.require(:sip).permit(:body)
  end
end
