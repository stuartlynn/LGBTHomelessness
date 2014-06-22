class VolunteerController < ApplicationController

  def create
    volunteer =  Volunteer.create!(first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      announcment: params[:announcements],
      location: params[:location],
      program_requirements: (params[:programRequirements_group].join(",")),
      age: params[:age],
      skills: (params[:skills_group].join(",")),
      time: (params[:time_group].join(",")),
      available: params[:available],
      anything_else: params[:anything_else] )
    if volunteer
      email = params[:email]
      name = params[:first_name] + " " + params[:last_name]
      message = "first_name: " + params[:first_name] + "\n"+
        "last_name: " + params[:last_name]+ "\n"+
        "email: " + params[:email]+ "\n"+
        "announcment: " + params[:announcements]+ "\n"+
        "location: " + params[:location]+ "\n"+
        "program_requirements: " + (params[:programRequirements_group].join(","))+ "\n"+
        "age: " + params[:age]+ "\n"+
        "skills: " + (params[:skills_group].join(","))+ "\n"+
        "time: " + (params[:time_group].join(","))+ "\n"+
        "available: " + params[:available]+ "\n"+
        "anything_else: " + params[:anything_else]

      recipient = "LGBTHomelessness@gmail.com"
      subject = "LGBTH Volunteer Sign-up"
      Emailer.volunteer(recipient, subject, name, email, message).deliver
      return if request.xhr?
      redirect_to "/", alert: "Volunteer form successfully submmitted."
    else
      flash[:error] = "Form submission failed."
      @error = "something is missing"
    end
  end 

  def index
    respond_to do |format|
      format.json {render :json => Volunteer.all}
    end
  end


end
