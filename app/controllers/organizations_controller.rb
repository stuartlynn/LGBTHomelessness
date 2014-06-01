class OrganizationsController < ActionController::Base
  respond_to :json, :html

  def index
    @organizations = Organization.all
    respond_with @organizations
  end

  def show
    @organization = Organization.find(params[:id])
    respond_with @organization
  end
end
