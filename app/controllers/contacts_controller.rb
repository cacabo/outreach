class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :edit, :update, :destroy]

    def index
        @contacts = Contact.all
    end

    def new
        @contact = Contact.new
    end

    def create
        if @contact = Contact.create(contact_params)
            flash[:success] = "Contact successfully created."
            redirect_to contacts_path
        else
            flash.now[:alert] = "Failed to add contac. Please check the form."
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @contact.update(contact_params)
            flash[:success] = "Contact updated."
            redirect_to(contact_path(@contact))
        else
            flash.now[:alert] = "Update failed. Please check the form."
            render :edit
        end
    end

    def destroy
        @contact.destroy
        flash[:success] = "Contact successfully deleted."
        redirect_to root_path
    end

    private

    def contact_params
        params.require(:contact).permit(:name, :email, :secondary_email, :cell, :work, :company, :role, :linkedin, :facebook, :notes)
    end

    def set_contact
        @contact = Contact.find(params[:id])
    end
end
