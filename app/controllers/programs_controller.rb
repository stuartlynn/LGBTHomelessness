class ProgramsController < ActionController::Base
  respond_to :json

  def index
    respond_with Program.all.to_json
  end

  def show
    respond_with Program.find(params[:id]).to_json
  end
end
