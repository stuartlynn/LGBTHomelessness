class ProgramsController < ActionController::Base
  respond_to :json, :html
  layout "application"

  def index
    @programs = Program.all
    respond_with @programs
  end

  def show
    p params
    @program = Program.find(params[:id])
    respond_with @program
  end
end
