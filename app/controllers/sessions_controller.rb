class SessionsController < ApplicationController

    def destroy
        session.clear
        redirect_to new_truck_path
    end

end