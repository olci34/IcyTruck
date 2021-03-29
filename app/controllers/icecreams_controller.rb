class IcecreamsController < ApplicationController
    before_action :set_icecream, only: [:show, :edit, :destroy, :update]
    def new
    end

    def create
    end

    def show
    end

    def edit
    end


    private

    def set_icecream
        @icecream = Icecream.find_by(id: params[:id])
    end

end