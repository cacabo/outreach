class ContactsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_contact, only: [:show, :edit, :update, :destroy]
    before_action :owned_contact, only: [:show, :edit, :update, :destroy]

    def index
        # Determine contacts
        if (current_user and params[:long_term])
            @contacts = current_user.contacts.where(:long_term)
        elsif (current_user)
            @contacts = current_user.contacts
        else
            @contacts = {}
        end

        # Determined reaches and responses
        @reaches = Reach.none
        @responses = Reach.none

        @contacts.each do |c|
            @reaches = @reaches.or(c.reaches.where(response: false))
            @responses = @responses.or(c.reaches.where(response: true))
        end
    end

    def new
        @contact = current_user.contacts.build
    end

    def create
        @contact = current_user.contacts.build(contact_params)

        if @contact.save
            flash[:success] = "Contact successfully created."
            redirect_to contacts_path
        else
            flash.now[:alert] = "Failed to add contact. Please check the form."
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
        params.require(:contact).permit(:name, :email, :secondary_email, :cell, :work, :company, :role, :linkedin, :facebook, :notes, :long_term)
    end

    def set_contact
        @contact = Contact.find(params[:id])
    end

    def owned_contact
        unless current_user == @contact.user
            flash[:alert] = "Contact does not belong to you"
            redirect_to root_path
        end
    end
end
