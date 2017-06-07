class ReachesController < ApplicationController
    before_action :set_contact

    def create
        @reach = @contact.reaches.build(reach_params)

        if @comment.save
            flash[:success] = "Reach added successfully."
            redirect_to :back
        else
            flash[:alert] = "Reach addition failed. Check the outreach form."
            render root_path
        end
    end

    def destroy
        @reach = @contact.comments.find(params[:id])

        @reach.destroy
        flash[:success] = "Outreach deleted"
        redirect_to @contact
    end

    private

    def comment_params
        params.require(:reach).permit(:time, :notes)
    end

    def set_post
        @contact = Contact.find(params[:contact_id])
    end
end
