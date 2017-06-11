class ReachesController < ApplicationController
    before_action :set_contact

    def create
        @reach = @contact.reaches.build(reach_params)

        if @reach.save
            flash[:success] = "Reach added successfully."
            redirect_to @contact
        else
            flash[:alert] = "Reach addition failed. Check the outreach form."
            render root_path
        end
    end

    def destroy
        @reach = @contact.reaches.find(params[:id])

        @reach.destroy
        flash[:success] = "Outreach deleted"
        redirect_to @contact
    end

    private

    def reach_params
        params.require(:reach).permit(:time, :notes, :response)
    end

    def set_contact
        @contact = Contact.find(params[:contact_id])
    end
end
