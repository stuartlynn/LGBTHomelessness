class ProgramsController < ActionController::Base
  respond_to :json, :html
  layout "application"

  before_action :get_org

  def index
    @programs = Program.all
    respond_with @programs
  end

  def show
    @program = Program.find(params[:id])
    respond_with @program
  end

  def new
    redirect_to '/' unless @organization
    @program = Program.new
    @program.organization_id = @organization.id
    @program
  end

  def edit
    @program = Program.find(prams[:id])
  end

  def update
    @program = Program.find(prams[:id]).update(program_params)
    redirect_to @program.organization
  end

  def create
    p = Program.create(program_params)
    redirect_to p
  end

  def program_params
    params[:program].permit(:name, :organization_id, :friendliness_rating, :min_age,:max_age,:health_status_req, :gender_req, :access_to_services, :description,:program_timing,:language_req,:program_categorization,:services)
  end

  def get_org
    if params[:organization_id]
      @organization = Organization.find(params[:organization_id])
    end
  end
end
