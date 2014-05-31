class OrganizationsController < ActionController::Base
  respond_to :json

  def index
    respond_with Organization.all.to_json
  end

  def show
    respond_with Organization.find(params[:id]).to_json
  end
end
