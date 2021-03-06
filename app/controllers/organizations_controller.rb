class OrganizationsController < ActionController::Base
  respond_to :json, :html
  layout "application"


  def index
    query = Program
    if(params[:age])
      query = query.age_range(params[:age])
    end

    if(params[:sex])
      query = query.gender_required(params[:sex])
    end

    if(params[:orientation])
      query = query.sexual_orientation_required(params[:orientation])
    end

    if(params[:spanish])
      query = query.language_needed(params[:spanish])
    end

    if(params[:services_group])
      #query = Program.service_query(query, params[:services_group].join(",").split(","))
      query = query.services_offered(params[:services_group].join(",").split(","))
    end

    @organizations = query.collect do |p| 
      if p.organization.city == params[:location]
        p.organization 
      end
    end
    respond_with @organizations.uniq
  end

  def edit
    @organization= Organization.find(params[:id])
  end

  def update
    binding.pry
    o = Organization.update(params[:id], organization_params)
    redirect_to o
  end

  def create
    @organization = Organization.create(organization_params)
    redirect_to @organization
  end

  def organization_params
    params[:organization].permit([:name, :description, :address, :address2, :city, :state, :zip, :phone_no, :website, :email, :latitude, :longitude])
  end

  def new
    @organization = Organization.new
    @organizations = query.collect{|p| p.organization}.uniq
    
    respond_with @organizations
  end

  def show
    @organization = Organization.find(params[:id])
    respond_with @organization
  end
end
