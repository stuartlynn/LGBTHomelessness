class ContactController < ApplicationController

  def create
    contact =  Contact.create!(name: params[:name], email: params[:email], message: params[:message])
    if contact
      redirect_to "/"
    else
      @error = "something is missing"
    end
  end


end
