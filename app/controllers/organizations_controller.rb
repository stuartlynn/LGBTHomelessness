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




    @organizations = query.all.collect{|p| p.organization}.uniq
    
    respond_with @organizations
  end

  def show
    @organization = Organization.find(params[:id])
    respond_with @organization
  end
end
