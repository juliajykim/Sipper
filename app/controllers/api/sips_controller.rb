class Api::SipsController < ApplicationController 
    def index
        @sips = Sip.all.includes(:author) 
        render :index
    end

    def create

    end

    def show
        @sip = Sip.find_by(id: params[:id])
        render :show
    end
end