class TrucksController < ApplicationController

    def new
    end

    def create
        binding.pry
        redirect_to trucks_path
    end

    def index
    end

end