class HomeController < ApplicationController

  def index

  end

  def about

  end

  def who

  end

  def volunteer

  end

  def calendar
  end

  def results
    @programs = Program.all()
  end

  def contact

  end

  def org_list
    
  end 

end
